# DevOps CI/CD with Docker Compose

Este proyecto proporciona un entorno robusto para la gestión del ciclo de vida del desarrollo de software, permitiendo a los equipos automatizar sus procesos de construcción, prueba y despliegue. La combinación de Jenkins, Gitea y PostgreSQL en un entorno Dockerizado facilita la escalabilidad y flexibilidad necesarias en proyectos modernos.

Nginx actúa como una capa intermedia eficiente entre los usuarios y los servicios principales del proyecto, optimizando el manejo del tráfico, mejorando la seguridad y garantizando una entrega rápida del contenido. Su rol como proxy inverso y servidor web es fundamental para asegurar que el sistema funcione de manera fluida y escalable.

## Crear imagen de jenkins con docker 

- Ejectar el comando: `docker build -t jenkins-docker-in-docker:lts-jdk17 .`

## Iniciar servicios

- Ejecutar el comando: `docker compose up -d`