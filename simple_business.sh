echo Current Systems Status: $(curl -s https://opsgenie.status.atlassian.com/api/v2/status.json | jq -r '.status.description')
echo
echo Last 3 incidents:
echo
curl -s https://opsgenie.status.atlassian.com/api/v2/incidents.json | jq -r '(.incidents[:3] | map({name, created_at, status}))'