FROM mcr.microsoft.com/azure-cli

COPY update /usr/local/bin

RUN az extension add --name azure-devops \
	&& wget https://github.com/mikefarah/yq/releases/download/v4.14.1/yq_linux_amd64.tar.gz -O - | tar xz \
	&& mv yq_linux_amd64 /usr/local/bin/yq

RUN chmod +x /usr/local/bin/update

ENTRYPOINT ["update"]