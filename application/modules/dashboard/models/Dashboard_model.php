<?php

class Dashboard_model extends CI_Model {

  
  /* ===== Today Sales ===== */
    public function today_sales_amount($org_id, $branch_id)
    {
        $today = strtotime(date('Y-m-d'));

        return $this->db
            ->select_sum('payableAmount')
            ->from('sales')
            ->where('organization_id', $org_id)
            ->where('branch_id', $branch_id)
            ->where('sales_date', $today)
            ->where('is_active', 1)
            ->get()->row()->payableAmount ?? 0;
    }

    /* ===== Total Sales ===== */
    public function total_sales_amount($org_id, $branch_id)
    {
        return $this->db
            ->select_sum('payableAmount')
            ->from('sales')
            ->where('organization_id', $org_id)
            ->where('branch_id', $branch_id)
            ->where('is_active', 1)
            ->get()->row()->payableAmount ?? 0;
    }

    /* ===== Today Purchases ===== */
    public function today_purchase_amount($org_id, $branch_id)
    {
        $today = strtotime(date('Y-m-d'));

        return $this->db
            ->select_sum('totalAmount')
            ->from('purchase')
            ->where('organization_id', $org_id)
            ->where('branch_id', $branch_id)
            ->where('purchase_date', $today)
            ->where('is_active', 1)
            ->get()->row()->totalAmount ?? 0;
    }

    /* ===== Total Purchases ===== */
    public function total_purchase_amount($org_id, $branch_id)
    {
        return $this->db
            ->select_sum('totalAmount')
            ->from('purchase')
            ->where('organization_id', $org_id)
            ->where('branch_id', $branch_id)
            ->where('is_active', 1)
            ->get()->row()->totalAmount ?? 0;
    }

    /* ===== Today Expense (Debit from GL) ===== */
    public function today_expense($org_id, $branch_id)
    {
        return $this->db
            ->select_sum('debit')
            ->from('acc_general_ledger')
            ->where('organization_id', $org_id)
            ->where('branch_id', $branch_id)
            ->where('voucher_type', 'Expense')
            ->where('date', date('Y-m-d'))
            ->where('is_active', 1)
            ->get()->row()->debit ?? 0;
    }
public function today_profit($org_id, $branch_id)
{
    $start = strtotime(date('Y-m-d 00:00:00'));
    $end   = strtotime(date('Y-m-d 23:59:59'));

    return $this->db
        ->select_sum('profit_loss')
        ->from('sales_item_batch_profit_loss')
        ->where('organization_id', $org_id)
        ->where('branch_id', $branch_id)
        ->where('sales_date >=', $start)
        ->where('sales_date <=', $end)
        ->where('is_returned', 0)
        ->get()
        ->row()
        ->profit_loss ?? 0;
}

public function monthly_profit($org_id, $branch_id)
{
    $start = strtotime(date('Y-m-01'));
    $end   = strtotime(date('Y-m-t'));

    return $this->db
        ->select_sum('profit_loss')
        ->from('sales_item_batch_profit_loss')
        ->where('organization_id', $org_id)
        ->where('branch_id', $branch_id)
        ->where('sales_date >=', $start)
        ->where('sales_date <=', $end)
        ->where('is_returned', 0)
        ->get()->row()->profit_loss ?? 0;
}

    /* ===== Total Profit ===== */
   public function total_profit($org_id, $branch_id)
{
    return $this->db
        ->select_sum('profit_loss')
        ->from('sales_item_batch_profit_loss')
        ->where('organization_id', $org_id)
        ->where('branch_id', $branch_id)
        ->where('is_returned', 0)
        ->get()->row()->profit_loss ?? 0;
}
public function latest_five_sales($org_id, $branch_id)
{
    return $this->db
        ->select('
            s.id,
            s.sales_date,
            s.invoice_no,
            s.payableAmount,
            s.dueAmount,
            s.is_active,
            s.customer_name
        ')
        ->from('sales s')
        ->where('s.organization_id', $org_id)
        ->where('s.branch_id', $branch_id)
        ->order_by('s.sales_date', 'DESC')
        ->limit(5)
        ->get()
        ->result();
}
   public function get_weekly_sales_purchases($org_id, $branch_id)
    {
        $week_labels    = [];
        $week_sales     = [];
        $week_purchases = [];

        for ($i = 6; $i >= 0; $i--) {

            $day_start = strtotime(date('Y-m-d 00:00:00', strtotime("-$i days")));
            $day_end   = strtotime(date('Y-m-d 23:59:59', strtotime("-$i days")));

            $week_labels[] = date('D', $day_start);

            // SALES
            $sales = $this->db
                ->select_sum('payableAmount')
                ->from('sales')
                ->where([
                    'organization_id' => $org_id,
                    'branch_id'       => $branch_id,
                    'is_active'       => 1
                ])
                ->where('sales_date >=', $day_start)
                ->where('sales_date <=', $day_end)
                ->get()->row()->payableAmount ?? 0;

            $week_sales[] = (float)$sales;

            // PURCHASE
            $purchase = $this->db
                ->select_sum('totalAmount')
                ->from('purchase')
                ->where([
                    'organization_id' => $org_id,
                    'branch_id'       => $branch_id,
                    'is_active'       => 1
                ])
                ->where('purchase_date >=', $day_start)
                ->where('purchase_date <=', $day_end)
                ->get()->row()->totalAmount ?? 0;

            $week_purchases[] = (float)$purchase;
        }

        return [
            'week_labels'    => $week_labels,
            'week_sales'     => $week_sales,
            'week_purchases' => $week_purchases
        ];
    }


     public function get_top_products($org_id, $branch_id, $month = null, $limit = 5) {
        if(!$month) $month = date('m');
        $month_start = strtotime(date("Y-$month-01 00:00:00"));
        $month_end   = strtotime(date("Y-$month-t 23:59:59"));

        $top_products = $this->db
            ->select("p.id, p.name as product_name, SUM(s.qty_sold) as total_qty, SUM(s.sales_price*s.qty_sold) as total_sales")
            ->from("sales_item_batch_profit_loss s")
            ->join("products p", "p.id = s.product_id")
            ->where("s.organization_id", $org_id)
            ->where("s.branch_id", $branch_id)
            ->where("s.is_returned", 0)
            ->where("s.sales_date >=", $month_start)
            ->where("s.sales_date <=", $month_end)
            ->group_by("s.product_id")
            ->order_by("total_sales", "DESC")
            ->limit($limit)
            ->get()
            ->result();

        return $top_products;
    }

}