<?php
if (!isset($_SESSION['admin_id'])) {
    header("Location: ../../src/logout.php");
    exit;
}

$host = "localhost";
$username = "root";
$password = "";
$dbname = "seenema";

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$adminName = $_POST['adminName'];
$adminPassword = password_hash($_POST['adminPassword'], PASSWORD_DEFAULT);

$checkStmt = $conn->prepare("SELECT adminName FROM admins WHERE adminName = ?");
$checkStmt->bind_param("s", $adminName);
$checkStmt->execute();
$checkStmt->store_result();

if ($checkStmt->num_rows > 0) {
    echo json_encode(["status" => "error", "message" => "Admin with this name already exists!"]);
    exit();
}

$checkStmt->close();

$stmt = $conn->prepare("INSERT INTO admins (adminName, adminPassword) VALUES (?, ?)");
$stmt->bind_param("ss", $adminName, $adminPassword);

if ($stmt->execute()) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error", "message" => "Error adding admin... " . $conn->error]);
}

$stmt->close();
$conn->close();
?>
