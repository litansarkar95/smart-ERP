<?php

// application/controllers/Notification.php
class Notification extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Notification_model');
    }

    public function fetch_notifications() {
        $notifications = $this->Notification_model->get_latest();
        $unread_count = $this->Notification_model->get_unread_count();
    
        echo json_encode([
            'data' => $notifications,
            'count' => $unread_count
        ]);
    }
    // Notification.php Controller
public function mark_as_read($id) {
    $this->load->model('Notification_model');
    $this->Notification_model->mark_as_read($id);
    echo json_encode(['status' => 'success']);
}

}
