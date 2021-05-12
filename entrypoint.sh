wget https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.7.0/imgpkg-linux-amd64
sudo chmod +x imgpkg-linux-amd64
sudo mv imgpkg-linux-amd64 /usr/bin/imgpkg
docker_url=https://download.docker.com/linux/static/stable/x86_64
docker_version=20.10.6
wget $docker_url/docker-$docker_version.tgz
sudo tar zxvf docker-20.10.6.tgz --strip 1 -C /usr/bin docker/docker
imgpkg copy -i ${source_registry} --to-tar=${source_registry}.tar
echo "${{ destination_registry_password }}" | docker login "${{ destination_registry }}" -u "${{ destination_registry_username }}" --password-stdin
imgpkg copy --tar nginx-1.20-alpine.tar --to-repo "${{ destination_registry }}"/test-repo/nginx

        

