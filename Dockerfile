FROM jenkins/jenkins:lts-jdk17
USER root

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y lsb-release

# Instalar Docker CLI
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli

# Agregar el usuario `jenkins` al grupo `docker`
RUN groupadd docker && usermod -aG docker jenkins

# Descargar la última versión de kubectl
RUN curl -LO https://dl.k8s.io/release/v1.30.2/bin/linux/amd64/kubectl

# Instalar kubectl moviéndolo a /usr/local/bin
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Limpiar los archivos descargados
RUN rm -f kubectl

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"