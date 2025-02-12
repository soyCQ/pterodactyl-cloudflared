FROM quay.io/parkervcp/pterodactyl-images:base_debian

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y curl wget

# Descargar e instalar cloudflared
RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    dpkg -i cloudflared-linux-amd64.deb && \
    rm cloudflared-linux-amd64.deb

# Eliminar el usuario existente si está presente
RUN userdel -r container || true

# Crear el nuevo usuario
RUN useradd -m -d /home/container -s /bin/bash container

# Copiar el script de entrada
COPY ./entrypoint.sh /home/container/entrypoint.sh

# Cambiar permisos del archivo
RUN chmod +x /home/container/entrypoint.sh

# Configurar el trabajo y usuario de directorio
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Establecer el punto de entrada y da acceso a la consola
ENTRYPOINT ["/bin/bash"]
CMD ["/home/container/entrypoint.sh"]
