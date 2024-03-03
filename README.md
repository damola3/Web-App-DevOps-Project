# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)
- [Technology Stack](#Technology Stack)

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


## Technology Stack

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
        - Kube API Server Rule - Allows inbound connections from public IP
        - SSH Rule - Allows inbound connections from Public IP


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


## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))


## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
