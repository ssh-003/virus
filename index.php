<?php
if (isset($_FILES['file'])) {
    $uploadDir = '/uploads';
    $uploadFile = $uploadDir . basename($_FILES['file']['name']);
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }
    if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadFile)) {
        echo "File was successfully uploaded.";
    } else {
        echo "File upload failed.";
    }
} else {
    echo "<h1>Lisning....</h1>";
}
?>
