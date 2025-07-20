import cicd.Constants
job( "SPRING_BOOT_END_2_END_PROJECT_COMPILE_JOB" ) {

    description( "JOB to compile SpringBoot_Project_End_2_End" )

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
            goals( "clean compile" )
            mavenInstallation( "M3" )
            rootPOM( "pom.xml" )
        }
    }
    publishers {
        downstream(Constants.INSTALL_JOB , "SUCCESS" )
    }

}

queue(Constants.COMPILE_JOB)