JOB("SpringBoot_Project_End_2_End Compile JOB") {
    description("JOB to Install SpringBoot_Project_End_2_End")
    scm {
        git {
            remote {
                url("https://github.com/SpringTechie/SpringBoot_Project_End_2_End.git")
            }
            branches("/*main")
        }
    }

    steps {
        maven {
            goals("clean install")
            mavenInstallation("M3")
            rootPOM("pom.xml")
        }
    }
    publishers {
        archiveArtifacts("target/*.jar")
    }
}