<?php
    class CustomerModel {

        public function select_users() {
            $sql = "SELECT username, full_name, email, phone FROM users";

            return pdo_query($sql);
        }

        public function select_email_in_users($email) {
            $sql = "SELECT * FROM users WHERE email = ?";

            return pdo_query_one($sql, $email);
        }

        public function user_insert($username, $password, $full_name, $image, $email, $phone, $address) {
            $sql = "INSERT INTO users(username, password, full_name, image, email, phone, address) VALUES(?,?,?,?,?,?,?)";

            pdo_execute($sql, $username, $password, $full_name, $image, $email, $phone, $address);
        }

        public function get_user_by_username($username) {
            $sql = "SELECT * FROM users WHERE username = ?";

            return pdo_query($sql, $username);
        }

        public function update_password($new_password, $user_id) {
            $sql = "UPDATE users SET password = ? WHERE user_id = ?";

            pdo_execute($sql, $new_password, $user_id);
        }

        public function reset_password($new_password, $email) {
            $sql = "UPDATE users SET password = ? WHERE email = ?";

            pdo_execute($sql, $new_password, $email);
        }

        public function update_user($full_name, $address, $phone, $image, $user_id) {
            $sql = "UPDATE users SET full_name = ?, address = ?, phone = ?, image = ? WHERE user_id = ?";
            pdo_execute($sql, $full_name, $address, $phone, $image, $user_id);
        }

        public function get_user_points($user_id) {
            $sql = "SELECT points FROM users WHERE user_id = ?";
            $result = pdo_query_one($sql, $user_id);
            return $result['points'];
        }

        public function update_user_points($user_id, $points) {
            $sql = "UPDATE users SET points = ? WHERE user_id = ?";
            pdo_execute($sql, $points, $user_id);
        }

        public function get_user_level($points) {
            if ($points >= 1000) {
                return 'VIP';
            } elseif ($points >= 500) {
                return 'Thành viên vàng';
            } elseif ($points >= 200) {
                return 'Thành viên bạc';
            } else {
                return 'Thành viên mới';
            }
        }

        public function update_user_level($user_id, $level) {
            $sql = "UPDATE users SET level = ? WHERE user_id = ?";
            pdo_execute($sql, $level, $user_id);
        }
    }

    $CustomerModel = new CustomerModel();
?>