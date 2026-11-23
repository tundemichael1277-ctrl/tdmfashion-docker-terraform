{
    "repository": {
        "repositoryArn": "arn:aws:ecr:eu-west-2:438294253750:repository/httpd",
        "registryId": "438294253750",
        "repositoryName": "httpd",
        "repositoryUri": "438294253750.dkr.ecr.eu-west-2.amazonaws.com/httpd",
        "createdAt": "2026-11-22T23:34:05.574000+00:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}
