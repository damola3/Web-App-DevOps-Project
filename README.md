# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![image](https://github.com/damola3/Web-App-DevOps-Project/assets/108272971/130abb5c-47b0-48e5-9f98-cf88de0544b9)


- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.

  ![image](https://github.com/damola3/Web-App-DevOps-Project/assets/108272971/07d1516f-eec2-4567-a03b-18286d478f10)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

### <ins>Docker<ins>

**DockerFile**:

    FROM - python 3.8-slim as parent image

    WORKDIR - /app as container working directory

    RUN - Installed system dependencies, OBDC driver & installed python package requirements.txt for the app

    EXPOSE 5000 (port)

    CMD - Run app.py on startup


**Build Process** -
    
    docker build -t pipeapp:1.0


**Running the Container** -
    
    docker run -it -p 5000:5000 pipeapp:1.0


**Tagging the Container** -
    
    docker tag 85d59c651687 Dockerhubname/pipeapp:1.0


**Pushing Container** -
    
    docker push Dockerhubname/pipeapp:1.0


### <ins>Terraform<ins>
**Resources Provisioned**: <ins>Note:<ins>
 Inputs and Outputs are documented in their respective files.
- **Networking Module:**
    - Resource Group: - Container for networking resources
        - Kube API Server Rule (Port 443) - Allows inbound connections from public IP
        - SSH Rule (Port 22) - Allows inbound connections from Public IP


    - Virtual Network: Allows for resources to share the same private network namespace
        - Control Plane Subnet - Private address space for control nodes of AKS cluster
        - Worker Node Subnet - Private address space for worker nodes of AKS cluster


- **AKS Module:**
    - Resource Group: - Refers to Resource Group created in earlier modules

    - AKS: Azure Kubernetes Cluster
        - Network_plugin - Set networking configuration, including the CIDR for service pods and an IP within this range for kube-dns
        - Node Pool - Configuration instructions for AKS nodes. (Autoscaling is enabled by default)
        - Tags - Optional tag(s) for cluster
        - Service Principle - Verification details for Azure

### <ins>Kubernetes Manifests Deployment<ins>
The containerised application built in Docker is packed with a Cluster IP configuration, with port 5000 exposed in order to test and validate its deployment.

<ins>**For deployment, the following routing configurations are recommended:**<ins>

- **Nodeport -** This allows connections to individual nodes, via private and/or public networks, of which traffic can then be redirected to any desired endpoint, to be distributed by the service configuration or by a custom load balancing solution. For example, a Robin Hood style configuration can be used to share load balancing service compute amongst nodes.  

  Nodeport can be very useful in testing deployments locally. However, it isn't particularly optimal deployments across the deiverse, as firewalls typically block traffic from these ports, given that the 30000-32767 ranges are not standard for web traffic.

- **Load Balancer** - In this recommended configuration, an individual IP is used as a gateway to expose application services to connections which satisfy a given network configuration.

- **Ingress -** An ingress would be most useful for mutualising hosting, in case there is a desire to integrate routing and load balancing resources with other internal applications.

        Deployment Command:

        kubectl port-forward deployment/inapp-deployment 5000:5000

### <ins>CI/CD Pipeline<ins>
Disclaimer: This briefly outlines steps taken to build a CI/CD pipeline in Azure DevOps. The application can be deployed across other CI/CD tools such as Jenkins, GitLab CI/CD etc.
- **Source -** The source-code has been cloned from the following [GitHub repository](https://github.com/damola3/Web-App-DevOps-Project).
- **Build Pipeline -** A connection has been made to the Docker Hub repository to enable this. Azure CI/CD builds from the dockerfile of the cloned repository and pushes a new build to Docker Hub.
- **Release Pipeline -** A connection has been made to my AKS cluster to enable this. AKS deploys the manifest file of this Azure DevOps file. Port-forwarding is then used to test that this deployment is in working condition.

### <ins>Monitoring<ins>
- **Dashboard (Metrics Explorer) -** A dashboard is recommended for monitoring purposes. Below is an example of one made via Azure Metrics Explorer. What matters is that log entries are pinged to a given cloud server for monitoring purposes. Excessive resource usage can dampen the reliability of client workloads and even cause temporary service unavailability. 
![image](https://github.com/damola3/Web-App-DevOps-Project/assets/108272971/0c22ee54-f61e-489c-8edf-aa9ed2f67263)

- **Logs** - An example of logs for per minute CPU usage (%).
![image](https://github.com/damola3/Web-App-DevOps-Project/assets/108272971/853fdefa-c001-4606-9593-9ffbac29a8f1)

- **Alerts** - It is recommended that an appropriate API be used to ping a phone or email once usage hits 100% and for automated scripts to be triggered once usage hits given thresholds (e.g. 80%), to auto-provision new resources. It is recommended that during test deployments, real world usage is modelled in peak usage, to collect insights and adapt provisisioning thresholds in such a way that maximises availability and minimises excess provisioning.

### <ins>Secrets<ins>
**Azure Key Vault** has been setup in the Python script using an Azure Entra identity & its API. Azure's web server is pinged to retrieve secrets for database login on the web server.


Note: Given the use of managed identities, the script above only works with authenticated devices, meaning that Cloud Shell or Azure App Service would be ideal test environments.

## Architecture
![DevOps Pipeline Architecture](https://github.com/damola3/Web-App-DevOps-Project/assets/108272971/38fb1740-9761-42b5-b8bb-50ce1de5b05a)

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))
- [Ayo Aroyehun]([https://github.com/yourusername](https://github.com/damola3))


## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
