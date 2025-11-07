$(document).ready(function(){
	$('.sidebar_collapse_btn').click(function(){
		$('.sidebar').toggleClass('hide');
		$('.body_content').toggleClass('hide');
		$('.sidebar_nav_txt').toggleClass('hide_txt');
	})
});

// data table
$(document).ready( function () {
    $('#order_list_table_list').DataTable();
    $('#order_list_table_list2').DataTable();
    $('#order_list_table_list3').DataTable();
    $('#order_list_table_list4').DataTable();
} );

// Disable search and ordering by default
$.extend( $.fn.dataTable.defaults, {
    searching: true,
    ordering:  true,
    select: true
} );


const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

// Left menu Dropdown

$('.sub_menu ul').hide();
$('.sub_menu_add ul').show();
$('.sub_menu_viewPage ul').show();
$('.sub_menu a').click(function(){
    $(this).parent('.sub_menu').children('ul').slideToggle('100');
    $(this).find('.right').toggleClass('fa-caret-up fa-caret-down');
});

// Sidebar

$(document).on('click', '.sidebar li', function(){
    $(this).addClass('active').siblings().removeClass('active')
});

$('.frm_toggle_btn').click(function(){
    $(this).find('.frm_tgl_icn').toggleClass('fa-toggle-on fa-toggle-off')
});

$('.eye_btn').click(function(){
    $(this).find('.eye_icn').toggleClass('fa-eye fa-eye-slash')
})


$('#showPw').click(function(){
    if($('#viewPw').attr('type') == 'password'){
        $('#viewPw').attr('type' , 'text');
    } else{
        $('#viewPw').attr('type' , 'password');
    }
});
$(document).ready(function() {
    $('.select2').select2();
});

    // File preview
    $(document).on("change", ".file-input-change", function () {
        let prevId = $(this).data("id");
        if(this.files && this.files[0]){
            var reader = new FileReader();
            reader.onload = function(e){
                $("#" + prevId).attr("src", e.target.result);
            };
            reader.readAsDataURL(this.files[0]);
        }
    });

// toggle buttom 
    // DataTables init
    $('#tableData, #tableData2, #tableData3, #tableData4').DataTable();

$('.pricing-toggle').click(function(){
    $(this).toggleClass('frm_toggle_select frm_toggle_deselect');
    $(this).toggleClass('select_toggle_container deselect_toggle_container');
})