pipeline {
    agent any 
    stages {
        stage('Build Docker image') {
            steps {
                sh 'cd ~/catkin_ws/src/ros1_ci && sudo docker buildx build -f dockerfile_tortoisebot_waypoints -t ros1-tortoisebot-waypoints .'
            }
        }
        stage('Run container') {
            steps {
                sh 'cd ~/catkin_ws/src/ros1_ci && sudo docker run --name test -d --rm -v ./test-script.sh:/test-script.sh ros1-tortoisebot-waypoints:latest'
                sleep 5
            }
        }
        stage('Run test') {
            steps {
                sh 'sudo docker exec test /test-script.sh'
            }
        }
        stage('Cleanup') {
            steps {
                sh 'sudo docker stop test'
                sh 'sudo docker rmi ros1-tortoisebot-waypoints:latest'
                sh 'sudo docker image prune -f'
                sh 'sudo docker container prune -f'
            }
        }
    }
}
