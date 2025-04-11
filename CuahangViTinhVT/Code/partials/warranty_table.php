<tbody>
    <?php foreach ($warranty_records as $record): ?>
        <tr id="row-<?= $record['id'] ?>">
            <td><?= $record['id'] ?></td>
            <td><?= $record['ten_hang'] ?></td>
            <td><?= $record['nguoi_gui'] ?></td>
            <td><?= $record['so_luong'] ?></td>
            <td><?= $record['tinh_trang_nhan'] ?></td>
            <td><?= $record['serial_no'] ?></td>
            <td><?= $record['ngay_gui_hang'] ?></td>
            <td><?= $record['dia_chi_bao_hanh'] ?></td>
            <td><?= $record['ngay_nhan'] ?></td>
            <td><?= $record['cong_no'] ?></td>
            <td><?= $record['da_xu_ly_xong'] ? 'Có' : 'Không' ?></td>
            <td><?= $record['ghi_chu'] ?></td>
            <td>
                <button class="btn btn-warning btn-sm edit-btn" onclick="enableEdit(<?= $record['id'] ?>)">Sửa</button>
                <button class="btn btn-success btn-sm save-btn d-none" onclick="saveEdit(<?= $record['id'] ?>)">Lưu</button>
                <a href="delete_warranty.php?id=<?= $record['id'] ?>" class="btn btn-danger btn-sm">Xóa</a>
            </td>
        </tr>
    <?php endforeach; ?>
</tbody>