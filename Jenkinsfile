pipeline {
    agent any 
    stages {
        stage('Build Docker image') {
            steps {
                sh 'cd ~/catkin_ws/src/ros1_ci'
                sh 'docker buildx build -f dockerfile_tortoisebot_waypoints -t ros1-tortoisebot-waypoints .'
            }
        }
        stage('Run container') {
            steps {
                sh 'cd ~/catkin_ws/src/ros1_ci'
                sh 'docker run --name test -d --rm -v ./test-script.sh:/test-script.sh ros1-tortoisebot-waypoints:latest'
                sleep 5
            }
        }
        stage('Run test') {
            steps {
                sh 'docker exec test /test-script.sh'
            }
        }
        stage('Cleanup') {
            steps {
                sh 'docker stop test'
                sh 'docker rmi ros1-tortoisebot-waypoints:latest'
                sh 'docker image prune'
                sh 'docker container prune'
            }
        }
    }
}
