import Constants
job( "SPRING_BOOT_END_2_END_PROJECT_INSTALL_JOB" ) {
    description( "JOB to Install SpringBoot_Project_End_2_End" )
    scm {
        git {
            remote {
                url(Constants.REPO_URL)
            }
            branches(Constants.BRANCH_NAME)
        }
    }

    steps {
        maven {
            goals( "clean install" )
            mavenInstallation( "M3" )
            rootPOM( "pom.xml" )
        }
    }
    publishers {
        archiveArtifacts( "target/*.jar" )
        downstream(Constants.DOCKER_JOB)
    }
}