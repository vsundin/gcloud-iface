FROM debian

RUN apt-get update && apt install sudo ca-certificates curl -y
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

RUN sudo apt-get install apt-transport-https ca-certificates gnupg -y
# Add the Cloud SDK distribution URI as a package source
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update the package list and install the Cloud SDK
RUN sudo apt-get update && sudo apt-get install google-cloud-sdk -y

# Install kubectl
RUN sudo apt-get install kubectl -y

COPY scripts /scripts
RUN chmod +x /scripts/*

CMD ["/scripts/docker-entrypoint.sh"]
