# To add spotify playlist using terraform

## Pre-requisites
Terraform
Docker
Spotify account
Spotify Developer account
Spotify Provider for terraform


## Process
1. we need to create a spotify developer account and get the client id and client secret from them
2. Place those in the .env file.
3. we need to create a auth proxy to connect spotify with our terraform. so run the below docker command to create a proxy container and be sure to keep it running
~~~
docker run --rm -it -p 27228:27228 --env-file .env ghcr.io/conradludgate/spotify-auth-proxy
~~~
4. This will give an api key and api link to access. we need to access the link and accept the terms.
5. we now need to create provide file to which the contents can be collected from below path.
## Registory for this terraform project
~~~
https://registry.terraform.io/providers/conradludgate/spotify/0.2.7
~~~
6. Next we need a provide the api key but since its a key value we can place it in terraform.tfvars and call it from variable file.
7. once done we can creart a playlist.tf to officialy create a playlist. the reference can be found in terraform registory documents from above link.


## full project in terraform website
~~~
https://developer.hashicorp.com/terraform/tutorials/community-providers/spotify-playlist
~~~
