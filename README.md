The only files I used for the Feb 2024 workshop are webapi.Dockerfile, frontend.Dockerfile, and dbsetup.Dockerfile. All the other stuff is unnecessary from the perspective of running things on Rahti. I used desdeo.yml for testing the frontend and backend together locally in docker. 

I built the images locally and then uploaded them to Rahti image registry at: https://registry-console.rahti.csc.fi

The images produced by webapi and frontend are best run as deployments, which can be easily done through the Rahti graphical user interface. 

The image produced by dbsetup would be better run as a job, because it is only intended to be run once, and deployments are ran over and over again if the execution finishes. Creating a job is not possible through the graphical interface (without creating a yaml file that specifies the job at least). It's probably easier to do this using the openshift client oc. If I were to do it today, I would ask chatgpt for instructions on how to do it.
