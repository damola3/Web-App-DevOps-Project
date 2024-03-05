# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![image](https://github.com/damola3/Web-App-DevOps-Project/assets/108272971/130abb5c-47b0-48e5-9f98-cf88de0544b9)


- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![image](https://github.com/damola3/Web-App-DevOps-Project/assets/108272971/20eb8e6a-540a-431d-873a-6564d04421dd)


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
        - Control Plane Subnet - Private address space for control nodes of AKS cluser
        - Worker Node Subnet - Private address space for worker nodes of AKS cluser


- **AKS Module:**
    - Resource Group: - Refers to Resource Group created in earlier modules

    - AKS: Azure Kubernetes Cluster
        - Node Pool - Configuration instructions for AKS nodes. (Autoscaling is enabled)
        - Tags - Optional tag(s) for cluster
        - Service Principle - Verification details for Azure

### <ins>Kubernetes Manifests Deployment<ins>
The containerised application built in Docker is packed with a Cluster IP configuration, with port 5000 exposed in order to test and validate its deployment.

<ins>**For deployment, the following are recommended:**<ins>

- **Nodeport -** This allows connections to individual nodes, via private and/or public networks, of which traffic can then be redirected to any desired endpoint, to be dsitributed by the service configuration or by a custom load balancing solution. For example, a Robin Hood style configuration can be used to share load balancing service compute amongst nodes.  

  Nodeport can be very useful in testing deployments locally. Given that the 30000-32767 ranges are not standard for web traffic, though can make it inapproprate for any deployment across the public internet, given firewalls typically block traffic from these ports.

- **Load Balancer** - In this recommended configuration, an individual IP is used as a gateway to expose application services to connections which satisfy any given network configuration.

- **Ingress -** An ingress would be most useful for mutualising hosting, in case there is a desire to integrate routing and load balancing resources with other internal applications.


## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))
- [Ayo Aroyehun]([https://github.com/yourusername](https://github.com/damola3))


## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
