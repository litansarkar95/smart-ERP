
			<style>

.navbar-nav .dropdown-menu {
    min-width: 200px; 
    white-space: nowrap; 
    overflow: hidden;
    text-overflow: ellipsis; 
}

/* ===== ALIGN ALL MENU ITEMS EQUALLY ===== */
.header_menu {
    display: flex;
    flex-wrap: wrap;
    align-items: stretch;     /* সব item same height */
}

.header_menu li {
    display: flex;
}

.header_menu li a {
    display: flex;
    align-items: center;      /* text vertically center */
    height: 100%;
    white-space: normal !important;
    line-height: 1.3;
}

        </style>
  
	<nav class="navbar navbar-expand-lg my_header_nav">
										  <div class="container-fluid">
										    <button class="navbar-toggler top_nav_toggle" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
										      <i class="fas fa-bars"></i>
										    </button>
										    <div class="collapse navbar-collapse" id="navbarSupportedContent">
										    <ul class="navbar-nav me-auto mb-2 mb-lg-0 header_menu">
										        <!-- <li class="nav-item">
										          <a class="nav-link <?php if($active == 'dashboard'  ){ echo 'active';} ?>"  aria-current="page" href="<?php echo base_url(); ?>dashboard">Dashboard</a>
										        </li> -->

                           
	 <?php
                        $user_id = $this->session->userdata('loggedin_id');
                        if($user_id == 1){

                        ?>
                         
                             <li class="nav-item dropdown">
										          <a  class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Super Admin </a>
										           <ul class="dropdown-menu nav_drpdown">
										            <li><a class="dropdown-item"   href="<?php echo base_url(); ?>branch/organization">Organization</a></li>
										          	<li><a class="dropdown-item"  href="<?php echo base_url(); ?>branch">Branch</a></li>
										          	<li><a class="dropdown-item"  href="<?php echo base_url(); ?>branch/staff">Branch Staff</a></li>
										          	<li><a class="dropdown-item"  href="<?php echo base_url(); ?>settings/sidebarmenu">Sidebar Menu Definition</a></li>
										          	<li><a class="dropdown-item"  href="<?php echo base_url(); ?>settings/permissions">Permissions Menu</a></li>
										          </ul>
										        </li>

                            <li class="nav-item">
										          <a class="nav-link "  aria-current="page" href="<?php echo base_url(); ?>settings/sidebarpermissions">Menu & Permissions</a>
										        </li>
                            <li class="nav-item">
										          <a class="nav-link "  aria-current="page" href="<?php echo base_url(); ?>settings/menupathpermissions">Roles & Permissions</a>
										        </li>
                            	  <?php
                        }
                        ?>
										         <!-- ================== Start Dynamic Menu ====================== -->
    <?php
$user_id = $this->session->userdata('loggedin_id');
$role_id = $this->session->userdata('loggedin_role_id');
$menus = $this->menu_model->get_user_menu($user_id, $role_id); // nested array tree
?>

<?php
// ====================== Dynamic Menu Render Function ======================
function render_menu($menus, $active, $is_child = false)
{
    foreach ($menus as $menu):
        $has_children = !empty($menu['children']);
        $is_active    = ($active == $menu['url']) ? 'active' : '';
        $caret_class = 'fa-caret-left';
        $is_parent_open = '';

        if ($has_children) {
            foreach ($menu['children'] as $child) {
                if (strpos(current_url(), site_url($child['url'])) !== false) {
                    $is_parent_open = 'open';
                    $caret_class = 'fa-caret-down';
                    break;
                }
            }
        }
?>
<li class="nav-item <?= $has_children ? 'dropdown' : ''; ?> <?= $is_active; ?> <?= $is_parent_open; ?>">
  <a class="nav-link <?= $has_children ? 'dropdown-toggle' : ''; ?>" href="<?= !empty($menu['url']) ? site_url($menu['url']) : 'javascript:void(0)'; ?>" role="button" data-bs-toggle="<?= $has_children ? 'dropdown' : ''; ?>" aria-expanded="false">
    <?= $menu['name']; ?>
   
  </a>

  <?php if ($has_children): ?>
      <ul class="dropdown-menu nav_drpdown">
        <?php render_menu($menu['children'], $active, true); ?>
      </ul>
  <?php endif; ?>
</li>
<?php
    endforeach;
}
?>

<!-- ====================== Sidebar Menu ====================== -->
<ul class="navbar-nav me-auto mb-2 mb-lg-0 header_menu">
    <?php render_menu($menus, $active); ?>

    <!-- Static Logout -->
    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('logout'); ?>">Logout </a>
    </li>
</ul>
<!-- ================== End Dynamic Menu ====================== -->


										
			

										       
										      </ul>
										    </div>
										  </div>
										</nav>