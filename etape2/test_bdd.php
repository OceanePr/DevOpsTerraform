<?php
$servername = getenv('DB_HOST');
$username = getenv('DB_USER');
$password = getenv('DB_PASS');
$dbname = getenv('DB_NAME');

// Connexion à la base de données
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Exécution de la requête de lecture
$sql = "SELECT COUNT(*) as count FROM test_table";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
$count = $row['count'];

// Exécution de la requête d'écriture
$conn->query("INSERT INTO test_table (data) VALUES ('test data')");

// Affichage du résultat
echo "Nombre de lignes : " . $count;

// Fermer la connexion
$conn->close();
?>
