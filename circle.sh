other_id=$(curl -s -X GET 'https://circleci.com/api/v2/project/gh/VeroMunoz/pipeline-ci-cd/pipeline?circle-token=${TOKEN}' | jq -r --arg CIRCLE_USERNAME "$CIRCLE_USERNAME" '.items[]|select(.state == "created").id')
echo $other_id

for other_id in $other_id
do
    workflow_id=$(curl -s --header "Circle-Token: $TOKEN" --request GET "https://circleci.com/api/v2/pipeline/${other_id}/workflow" | jq -r '.items[]|select(.status == "on_hold").id')
    echo $workflow_id 
    curl -s --header "Circle-Token: $PERSONAL_TOKEN" -X POST 'https://circleci.com/api/v2/workflow/${workflow_id}/cancel'
done