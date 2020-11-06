# On-Premise Deployments

## Project Dscription:

This project aims to solve on-premise application deployment. This is demonstrated by deploying parse-server on kubernetes. The entire project focueses on resolving issues including Ease of clustered enterprise level deployments,Incremental remotely triggered application updates,Easy remote debugging, Health Alerts and Monitoring, Application Security (with source code protection) and Disaster management.

GitHub repo link: https://blahh

## Installation and Usage Instructions

Tools/Softwares/Services used:

- Kuberntes using Microk8s

- Lens (IDE for Kubernetes) 

- Helm/Helm Charts

- Parse Server

- Prometheus 

- Grafana

- Weavely Cloud

- GitHub

### Pre-requisites

Note:I am solving this problem on my local machine as I do not have access to any Cloud services.

Operating System : Ubuntu 18.04 LTE

### Steps

#### Kubernetes Setup:
Initially we need to setup Kubernetes : ([Setting up Kubernetes using Microk8s on Ubuntu](https://microk8s.io/docs))

Use the following commands:

`sudo snap install microk8s --classic`

`sudo usermod -a -G microk8s $USER`

`sudo chown -f -R $USER ~/.kube`

This will give us Kubectl command line tool and kube config file.

Add an alias in .bashrc as follows to make things simpler:

`
alias kubectl="microk8s.kubectl"`
`

Run `source .bashrc` after making changes to .bashrc file.

Incase you don't find a config file in ~/.kube directory follow the steps below

`
microk8s config > ~/.kube/config
`
Give read,write and execute permissions only to the user

`chmod 700 ~/.kube/config`

Now let's run kubernetes cluster

`microk8s start`

Check status using the following commands and make sure everything is running.

`kubectl get nodes` (Check if node is ready. We are using a single node.)

`kubectl get all --all-namespaces`



#### [Lens](https://k8slens.dev/) Setup:

Lens is and IDE for working Kubernetes clusters. You just need to pass in the kube config file and it takes care of the rest.

[Installing Lens](https://github.com/lensapp/lens/releases/tag/v3.6.7)

I have downloaded the AppImage which is extremely easy to use. After download give executable permissions to file and run using the following command

`./Lens-3.6.6.AppImage`

Provide path to kubernetes config file and it gets all the information about the cluster.


#### [Helm](https://helm.sh/) Setup:

Helm is the Package Manager for Kubernetes.Helm is the best way to find, share, and use software built for Kubernetes.

[Installing helm](https://helm.sh/docs/intro/install/)

I prefer installing it from script.

Helm now has an installer script that will automatically grab the latest version of Helm and install it locally.

Run the following commands:

`curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3`

`chmod 700 get_helm.sh`

`./get_helm.sh`

#### [Parse Server](https://github.com/parse-community/parse-server) Setup:

Parse Server is an open source backend that can be deployed to any infrastructure that can run Node.js.

We are going to setup parse server using  helm charts. [Artifact Hub](https://artifacthub.io/) has a lot of kubernetes package.
Search for the required package and it provides us with clear instructions about how to use it. We can also do it using command line as follows.

Repo used for pulling parse chart : Bitnami

Bitnami makes it easy to get your favorite open source software up and running on any platform, including your laptop, Kubernetes and all the major clouds.

Pull Bitnami repo

`helm repo add bitnami https://charts.bitnami.com/bitnami`

Search for for the parse package

`helm search repo parse`

We will use bitnami/parse which is stable

Let's inspect the values of bitnami/parse chart

`helm inspect values bitnami/parse >> ~/atlanwork/parse.values`

We need to change the service type from LoadBalance to NodePort as we are running it in local environment.Make the following changes (nodePort: 32322 type: NodePort)

Create a namespace which helps monitoring easy

`kubectl create namespace parse`

**Deploying parse server using helm chart**

name: parse-server 
namespace: parse

`helm install parse-server bitname/parse --values parse.values -n parse`

Wait for sometime until the parse-server is deployed. Check the status on Lens which is very user-friendly.

Now we need to follow the instructions provided by bitnami chart i.e to get the port numbers from services deployed.

Run the following commands


Finally make curl request 

`
curl -X POST \
-H "X-Parse-Application-Id: APPLICATION_ID" \
-H "Content-Type: application/json" \
-d '{"score":1337,"playerName":"Sean Plott","cheatMode":false}' \
http://$SERVICE_HOST/parse/classes/GameScore
`

You should get a response similar to this:

`
{
  "objectId": "2ntvSpRGIK",
  "createdAt": "2016-03-11T23:51:48.050Z"
}
`
















