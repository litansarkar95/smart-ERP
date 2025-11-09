

  <style>
  
    /* ===== Card Common Style ===== */
    .card {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
      margin-bottom: 25px;
      padding: 20px;
    }

    .card-header {
      display: flex;
      align-items: center;
      border-bottom: 1px solid #e5e9f0;
      margin-bottom: 15px;
      padding-bottom: 10px;
    }

    .card-header i {
      color: #007bff;
      margin-right: 10px;
      font-size: 18px;
    }

    .card-header h2 {
      font-size: 18px;
      font-weight: 600;
      color: #333;
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

    /* ===== Latest Sales Table ===== */
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
      display: flex;
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

    canvas {
      width: 100% !important;
      height: 300px !important;
    }

    .chart-legend {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-top: 15px;
      flex-wrap: wrap;
    }

    .legend-item {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 14px;
      color: #555;
    }

    .legend-color {
      width: 14px;
      height: 14px;
      border-radius: 3px;
    }
  </style>
 <div class="container-fluid">

  <div class="row px-3">
  <!-- === Quick Links Section === -->
  <div class="quick-links">
    <h3>Quick Links</h3>
    <div class="link-grid">
      <div class="link-box products"><i class="fas fa-box"></i>Products</div>
      <div class="link-box sales"><i class="fas fa-heart"></i>Sales</div>
      <div class="link-box quotations"><i class="fas fa-file-alt"></i>Quotations</div>
      <div class="link-box purchases"><i class="fas fa-shopping-cart"></i>Purchases</div>
      <div class="link-box transfers"><i class="fas fa-exchange-alt"></i>Transfers</div>
      <div class="link-box customers"><i class="fas fa-users"></i>Customers</div>
      <div class="link-box suppliers"><i class="fas fa-truck"></i>Suppliers</div>
      <div class="link-box notifications"><i class="fas fa-bell"></i>Notifications</div>
      <div class="link-box users"><i class="fas fa-user"></i>Users</div>
      <div class="link-box settings"><i class="fas fa-cog"></i>Settings</div>
    </div>
  </div>
  <!-- === Overview Summary Cards === -->
  <div class="card">
    <div class="card-header">
      <i class="fas fa-chart-line"></i>
      <h2>Overview Summary</h2>
    </div>
    <div class="summary-grid">
      <div class="summary-card today-sales">
        <i class="fas fa-hand-holding-usd"></i>
        <h4>Today Sales</h4>
        <p>৳ 12,350</p>
      </div>
      <div class="summary-card total-sales">
        <i class="fas fa-chart-bar"></i>
        <h4>Total Sales</h4>
        <p>৳ 5,48,200</p>
      </div>
      <div class="summary-card today-purchases">
        <i class="fas fa-shopping-cart"></i>
        <h4>Today Purchases</h4>
        <p>৳ 8,760</p>
      </div>
      <div class="summary-card total-purchases">
        <i class="fas fa-warehouse"></i>
        <h4>Total Purchases</h4>
        <p>৳ 4,18,900</p>
      </div>
      <div class="summary-card today-expense">
        <i class="fas fa-money-bill-wave"></i>
        <h4>Today Expense</h4>
        <p>৳ 2,120</p>
      </div>
      <div class="summary-card total-profit">
        <i class="fas fa-coins"></i>
        <h4>Total Profit</h4>
        <p>৳ 1,29,300</p>
      </div>
    </div>
  </div>

  <!-- === Latest Five Sales Section === -->
  <div class="card">
    <div class="card-header">
      <i class="fas fa-receipt"></i>
      <h2>Latest Five Sales</h2>
    </div>
    <table>
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
        <tr>
          <td>1</td>
          <td>04 Nov 2025</td>
          <td>INV-1005</td>
          <td>Rahim Traders</td>
          <td>৳ 4,250</td>
          <td><span class="status paid">Paid</span></td>
        </tr>
        <tr>
          <td>2</td>
          <td>03 Nov 2025</td>
          <td>INV-1004</td>
          <td>Hasan Electronics</td>
          <td>৳ 3,980</td>
          <td><span class="status pending">Pending</span></td>
        </tr>
        <tr>
          <td>3</td>
          <td>03 Nov 2025</td>
          <td>INV-1003</td>
          <td>Nazrul Store</td>
          <td>৳ 2,540</td>
          <td><span class="status paid">Paid</span></td>
        </tr>
        <tr>
          <td>4</td>
          <td>02 Nov 2025</td>
          <td>INV-1002</td>
          <td>Alif Traders</td>
          <td>৳ 6,120</td>
          <td><span class="status cancelled">Cancelled</span></td>
        </tr>
        <tr>
          <td>5</td>
          <td>02 Nov 2025</td>
          <td>INV-1001</td>
          <td>Kabir Telecom</td>
          <td>৳ 5,890</td>
          <td><span class="status paid">Paid</span></td>
        </tr>
      </tbody>
    </table>
  </div>





<div class="card">
    <div class="card-header">
      <i class="fas fa-chart-line"></i>
      <h2>Overview Chart</h2>
    </div>
    <canvas id="overviewChart"></canvas>

    <div class="chart-legend">
      <div class="legend-item"><span class="legend-color" style="background:#4e73df"></span>Sales</div>
      <div class="legend-item"><span class="legend-color" style="background:#1cc88a"></span>Purchases</div>
      <div class="legend-item"><span class="legend-color" style="background:#f6c23e"></span>Profit</div>
    </div>
  </div>


   </div>

    </div>
   <script>
    const ctx = document.getElementById('overviewChart').getContext('2d');
    const overviewChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
        datasets: [
          {
            label: 'Sales',
            backgroundColor: '#4e73df',
            data: [12000, 15000, 13000, 18000, 17000, 19000, 21000],
            borderRadius: 6
          },
          {
            label: 'Purchases',
            backgroundColor: '#1cc88a',
            data: [9000, 11000, 12000, 14000, 13500, 15000, 16000],
            borderRadius: 6
          },
          {
            label: 'Profit',
            type: 'line',
            borderColor: '#f6c23e',
            borderWidth: 3,
            fill: false,
            tension: 0.3,
            data: [3000, 4000, 1000, 4000, 3500, 4000, 5000]
          }
        ]
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true,
            ticks: { color: '#666' },
            grid: { color: '#eaeaea' }
          },
          x: {
            ticks: { color: '#666' },
            grid: { display: false }
          }
        },
        plugins: {
          legend: { display: false },
          tooltip: {
            backgroundColor: '#333',
            titleFont: { size: 13 },
            bodyFont: { size: 12 },
            padding: 10,
            cornerRadius: 6
          }
        }
      }
    });
  </script>