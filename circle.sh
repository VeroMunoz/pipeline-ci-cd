 pipeline_id=$(curl -s -X GET 'https://circleci.com/api/v2/project/gh/VeroMunoz/pipeline-ci-cd/pipeline?circle-token=${TOKEN}' | jq -r --arg CIRCLE_USERNAME "$CIRCLE_USERNAME" '.items[]|select(.state == "created").id')
echo $pipeline_id  
for pipeline_id in $pipeline_id
    do
    workflow_id=$(curl -s -X GET "https://circleci.com/api/v2/pipeline/${pipeline_id}/workflow" | jq -r '.items[]|select(.status == "on_hold").id')
    echo $workflow_id
    curl -s --header "Circle-Token: $PERSONAL_TOKEN" -X POST https://circleci.com/api/v2/workflow/${workflow_id}/cancel
    done 