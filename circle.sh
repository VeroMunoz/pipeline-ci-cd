other_id=$(curl -s -X GET 'https://circleci.com/api/v2/project/gh/VeroMunoz/pipeline-ci-cd/pipeline?circle-token=${TOKEN}' | jq -r --arg CIRCLE_USERNAME "$CIRCLE_USERNAME" '.items[]|select(.state == "created").id')
echo $other_id

for other_id in $other_id
do

    #workflow_id=$(curl -s --header "Circle-Token: $MyToken" --request GET "https://circleci.com/api/v2/pipeline/${other_id}/workflow" | jq -r '.items[]|select(.status == "on_hold").id')
    #echo $workflow_id
    i=0
    #curl --header "Circle-Token: $TOKEN"  --request POST 'https://circleci.com/api/v2/workflow/d287ee15-0ecd-4378-a58c-bbb3b857a60e/cancel'
done