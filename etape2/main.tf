resource "docker_container" "db" {
  image = "mysql:8.0.32"  # Utilise MySQL version 8.0.32
  name  = "db"

  env = [
    "MYSQL_ROOT_PASSWORD=root",  # Mot de passe pour l'utilisateur root
    "MYSQL_DATABASE=test_db",      # Base de données à créer
    "MYSQL_USER=user",             # Utilisateur supplémentaire
    "MYSQL_PASSWORD=password"      # Mot de passe de l'utilisateur supplémentaire
  ]

  ports {
    internal = 3306   # Port interne dans le conteneur
    external = 3306   # Port exposé sur l'hôte
  }

  volumes {
    host_path      = "C:\\Users\\ocean\\docker\\IaC\\etape2\\db_data"  # Chemin absolu pour stocker les données persistantes
    container_path = "/var/lib/mysql"                                  # Chemin dans le conteneur
  }
}
