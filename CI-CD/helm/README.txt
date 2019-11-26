# test helm charter

helloworld is a kubernetes deployment deployed by helm chart.
It will pass ECR repo ImageName and ECR ImageTag from value.yaml to deployment_helloworld.yaml

# Files
- Chart.yaml             # A YAML file containing information about the chart.
- README.md              # A README file.
- Dockerfile             # Used to bake docker image to ECR repo.
- values.yaml            # The default configuration values for this chart
- templates/             # A directory of templates that, when combined with values,
                         # will generate valid Kubernetes manifest files. 
- templates/NOTES.txt                     # A plain text file containing short usage notes
- templates/deployment_helloworld.yaml    # A kubernetes deployment file for helloworld.


e.g.  /usr/local/bin/helm install --name=helloworld --namespace=default ./ --set image.repository=helloworld.k8s.java.repo --set image.tag=12nwi3i4i5j6j6j4j3k --set namespace=default
