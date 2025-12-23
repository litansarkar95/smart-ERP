

  <style>
  
    /* ===== Card Common Style ===== */
    .card {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
      margin-bottom: 25px;
      padding: 20px;
    }

  

  

    /* ===== Summary Cards ===== */
    .summary-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 15px;
    }

    .summary-card {
      border-radius: 10px;
      padding: 20px 15px;
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 10px;
      text-align: center;
      transition: all 0.2s ease-in-out;
    }

    .summary-card:hover {
      transform: translateY(-4px);
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    .summary-card i {
      font-size: 28px;
      opacity: 0.9;
    }

    .summary-card h4 {
      font-size: 15px;
      font-weight: 600;
    }

    .summary-card p {
      font-size: 18px;
      font-weight: 700;
    }

    .today-sales { background: #1cc88a; }
    .total-sales { background: #4e73df; }
    .today-purchases { background: #e74a3b; }
    .total-purchases { background: #36b9cc; }
    .today-expense { background: #f6c23e; color: #fff; }
    .total-profit { background: #6f42c1; }

    /* ===== Quick Links ===== */
    .quick-links {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
      padding: 20px;
    }

    .quick-links h3 {
      border-bottom: 1px solid #e5e9f0;
      padding-bottom: 10px;
      font-size: 17px;
      color: #333;
      font-weight: 600;
      margin-bottom: 15px;
    }

    .link-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
      gap: 15px;
    }

    .link-box {
      border-radius: 10px;
      padding: 18px 10px;
      color: #fff;
      font-weight: 600;
      text-align: center;
      cursor: pointer;
      transition: all 0.2s ease-in-out;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }

    .link-box i {
      font-size: 22px;
    }

    .link-box:hover {
      transform: translateY(-4px);
      box-shadow: 0 4px 10px rgba(0,0,0,0.15);
    }

    .products { background: #4e73df; }
    .sales { background: #1cc88a; }
    .quotations { background: #f6c23e; }
    .purchases { background: #e74a3b; }
    .transfers { background: #e83e8c; }
    .customers { background: #858796; }
    .suppliers { background: #20c997; }
    .notifications { background: #36b9cc; }
    .users { background: #5a5c69; }
    .settings { background: #6f42c1; }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }

    th, td {
      padding: 10px 12px;
      text-align: left;
    }

    th {
      background: #f8f9fc;
      color: #444;
      font-weight: 600;
      border-bottom: 2px solid #e5e9f0;
    }

    tr:nth-child(even) {
      background: #f9fbfd;
    }

    tr:hover {
      background: #eef3ff;
    }

    td {
      font-size: 14px;
      color: #333;
    }

    .status {
      font-weight: 600;
      border-radius: 20px;
      padding: 4px 10px;
      font-size: 12px;
      color: #fff;
    }

    .paid { background: #1cc88a; }
    .pending { background: #f6c23e; color: #fff; }
    .cancelled { background: #e74a3b; }
    .card {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      padding: 20px;
      margin-bottom: 25px;
    }

    .card-header {
    
      align-items: center;
      gap: 8px;
      border-bottom: 1px solid #e5e9f0;
      padding-bottom: 10px;
      margin-bottom: 15px;
    }

    .card-header i {
      color: #007bff;
      font-size: 18px;
    }

    .card-header h2 {
      font-size: 18px;
      font-weight: 600;
      color: #333;
    }

 
    .summary-card i {
  font-size: 32px; 
  opacity: 0.9;
}

.summary-card h4 {
  font-size: 14px;
  font-weight: 500;
  margin: 0;
}

.summary-card p {
  font-size: 18px;
  font-weight: 700;
  margin: 0;
}
.link-box:hover {
  transform: scale(1.05);
  box-shadow: 0 6px 15px rgba(0,0,0,0.15);
}
.chart-legend {
  display: flex;
  justify-content: center;
  gap: 20px;
  flex-wrap: wrap;
}
.card-header {

}
.link-box {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 8px;
    border-radius: 10px;
    padding: 18px 10px;
    color: #fff;
    font-weight: 600;
    text-align: center;
    transition: all 0.2s ease-in-out;
    text-decoration: none; 
}

.link-box:hover {
    transform: translateY(-4px);
    box-shadow: 0 4px 10px rgba(0,0,0,0.15);
    color: #fff; 
}

  </style>

  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
:root{
  --primary:#7C5CFC;
  --primary-light:#CFC5FF;
  --bg:#F6F8FC;
  --card:#FFFFFF;
  --border:#E5E7EB;
  --text:#1F2937;
}


.dashboard{
  display:grid;
  grid-template-columns: 2fr 1fr;
  gap:20px;
}

.card{
  background:var(--card);
  border-radius:14px;
  padding:20px;
  box-shadow:0 10px 25px rgba(0,0,0,.06);
}

.card-header{
  font-size:16px;
  font-weight:600;
  color:var(--text);
  margin-bottom:15px;
  display:flex;
  justify-content:space-between;
  align-items:center;
}

.card-header span{
  font-size:20px;
  cursor:pointer;
  color:#9CA3AF;
}

.chart-box{
  height:320px;
}

/* Donut center text */
.donut-wrap{
  position:relative;
  height:320px;
}
.donut-center{
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  text-align:center;
}
.donut-center small{
  color:#6B7280;
}
.donut-center h2{
  margin:5px 0 0;
}
.legend{
  display:flex;
  justify-content:center;
  gap:15px;
  margin-top:10px;
  font-size:13px;
}
.legend span{
  display:flex;
  align-items:center;
  gap:6px;
}
.dot{
  width:10px;
  height:10px;
  border-radius:50%;
}
</style>
 <div class="container-fluid">

  <div class="row px-3">
  <!-- === Quick Links Section === -->
  <div class="quick-links">

  <h3>Quick Links</h3>
  <div class="link-grid">
      <?php// if (has_permission('products', 'index')): ?>
    <a href="<?php echo base_url(); ?>products" class="link-box products">
      <i class="fas fa-box"></i>Products
    </a>
      <?php // endif; ?>
      <!-- Start --> 

    <a href="<?php echo base_url(); ?>sales/create" class="link-box sales">
      <i class="fas fa-heart"></i>Sales
    </a>

    <!-- End -->
     <!-- Start --> 

    <a href="<?php echo base_url(); ?>quotation" class="link-box quotations">
      <i class="fas fa-file-alt"></i>Quotations
    </a>

     <!-- End -->
     <!-- Start --> 

    <a href="<?php echo base_url(); ?>purchase/purchasebatch/create" class="link-box purchases">
      <i class="fas fa-shopping-cart"></i>Purchases
    </a>

     <!-- End -->
    <a href="transfers.php" class="link-box transfers">
      <i class="fas fa-exchange-alt"></i>Transfers
    </a>
    <a href="customers.php" class="link-box customers">
      <i class="fas fa-users"></i>Customers
    </a>
    <a href="suppliers.php" class="link-box suppliers">
      <i class="fas fa-truck"></i>Suppliers
    </a>
    <a href="notifications.php" class="link-box notifications">
      <i class="fas fa-bell"></i>Notifications
    </a>
    <a href="users.php" class="link-box users">
      <i class="fas fa-user"></i>Users
    </a>
    <a href="settings.php" class="link-box settings">
      <i class="fas fa-cog"></i>Settings
    </a>
  </div>
</div>

  <div class="card mt-3">
  <div class="card-header">
    <i class="fas fa-chart-line"></i>
    <h2 >Overview Summary</h2>
  </div>

  <div class="summary-grid">

    <div class="summary-card today-sales">
      <i class="fas fa-hand-holding-usd"></i>
      <h4>Today Sales</h4>
      <p>৳ <?php echo number_format($today_sales,2); ?></p>
    </div>

    <div class="summary-card total-sales">
      <i class="fas fa-chart-bar"></i>
      <h4>Total Sales</h4>
      <p>৳ <?php echo number_format($total_sales,2); ?></p>
    </div>

    <div class="summary-card today-purchases">
      <i class="fas fa-shopping-cart"></i>
      <h4>Today Purchases</h4>
      <p>৳ <?php echo number_format($today_purchase,2); ?></p>
    </div>

    <div class="summary-card total-purchases">
      <i class="fas fa-warehouse"></i>
      <h4>Total Purchases</h4>
      <p>৳ <?php echo number_format($total_purchase,2); ?></p>
    </div>

    <div class="summary-card today-expense">
      <i class="fas fa-money-bill-wave"></i>
      <h4>Today Expense</h4>
      <p>৳ <?php echo number_format($today_expense,2); ?></p>
    </div>

    <div class="summary-card total-profit">
      <i class="fas fa-coins"></i>
      <h4>Today Profit</h4>
      <p>৳ <?php echo number_format($today_profit,2); ?></p>
    </div>

  </div>
</div>





<div class="dashboard">

  <!-- Weekly Sales -->
  <div class="card">
    <div class="card-header">
      This Week Sales & Purchases
      <span>☰</span>
    </div>
    <div class="chart-box">
      <canvas id="salesChart"></canvas>
    </div>
  </div>

  <!-- Top Selling -->

<div class="card">
  <div class="card-header">Top Selling Products (<?= date('F Y'); ?>)</div>
  <div class="donut-wrap">
    <canvas id="donutChart"></canvas>
    <div class="donut-center">
      <small>Total Sales</small>
      <h2><?= $total_top_sales ?? 0; ?></h2>
    </div>
  </div>

  <div class="legend">
    <?php foreach($top_products as $p): ?>
      <span><i class="dot"></i><?= $p->product_name; ?></span>
    <?php endforeach; ?>
  </div>
</div>





</div>

  <!-- === Latest Five Sales Section === -->
  <div class="card">
  <div class="card-header">
    <i class="fas fa-receipt"></i>
    <h2>Latest Five Sales</h2>
  </div>

  <div class="table-responsive">
    <table class="table table-bordered table-sm">
      <thead>
        <tr>
          <th>#</th>
          <th>Date</th>
          <th>Invoice No</th>
          <th>Customer</th>
          <th>Total</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>

      <?php if (!empty($latest_sales)): ?>
        <?php $i=1; foreach ($latest_sales as $row): ?>

          <?php
            // Status Logic
            if ($row->is_active == 0) {
                $status = 'Cancelled';
                $class  = 'cancelled';
            } elseif ($row->dueAmount > 0) {
                $status = 'Due';
                $class  = 'pending';
            } else {
                $status = 'Paid';
                $class  = 'paid';
            }
          ?>

          <tr>
            <td><?= $i++; ?></td>
            <td><?= date('d M Y', $row->sales_date); ?></td>

            <td>
              <a href="<?= base_url('sales/view/'.$row->id); ?>">
                <?= $row->invoice_no; ?>
              </a>
            </td>

            <td><?= $row->customer_name; ?></td>

            <td>৳ <?= number_format($row->payableAmount, 2); ?></td>

            <td>
              <span class="status <?= $class; ?>">
                <?= $status; ?>
              </span>
            </td>
          </tr>

        <?php endforeach; ?>
      <?php else: ?>
        <tr>
          <td colspan="6" class="text-center text-muted">
            No sales found
          </td>
        </tr>
      <?php endif; ?>

      </tbody>
    </table>
  </div>
</div>


   </div>

    </div>
   


    <script>
const donutLabels = <?= json_encode($donut_labels); ?>;
const donutData   = <?= json_encode($donut_data); ?>;
const donutColors = <?= json_encode($donut_colors); ?>;

new Chart(document.getElementById('donutChart'), {
    type: 'doughnut',
    data: {
        labels: donutLabels,
        datasets: [{
            data: donutData,
            backgroundColor: donutColors,
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: { position: 'bottom' },
            tooltip: {
                callbacks: {
                    label: function(context) {
                        return '৳ ' + context.raw;
                    }
                }
            }
        }
    }
});
</script>



<script>
const salesLabels = <?= json_encode($week_labels); ?>;
const salesData   = <?= json_encode($week_sales); ?>;
const purchaseData= <?= json_encode($week_purchases); ?>;

new Chart(document.getElementById('salesChart'), {
  type: 'bar',
  data: {
    labels: salesLabels,
    datasets: [
      {
        label: 'Sales',
        data: salesData,
        backgroundColor: '#7C5CFC',
        borderRadius: 8,
      },
      {
        label: 'Purchases',
        data: purchaseData,
        backgroundColor: '#D9D2FF',
        borderRadius: 8,
      }
    ]
  },
  options: {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: { position: 'bottom' },
      tooltip: { enabled: true }
    },
    scales: {
      y: {
        beginAtZero: true,
        ticks: {
          callback: value => '৳ ' + value
        }
      },
      x: { grid: { display:false } }
    }
  }
});
</script>