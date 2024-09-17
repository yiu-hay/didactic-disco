echo Current Systems Status: $(curl -s https://opsgenie.status.atlassian.com/api/v2/status.json | jq -r '.status.description')
echo
echo Last 3 incidents:
echo
curl -s https://opsgenie.status.atlassian.com/api/v2/incidents.json | jq -r '(.incidents[:3] | map({name, created_at, status}))'

# Extra Time
echo Current Systems Status: $(curl -s https://opsgenie.status.atlassian.com/api/v2/status.json | jq -r '.status.description')
echo
echo Last 3 incidents:
echo
# Loop through the first three incidents
for i in {0..2}; do
  curl -s https://opsgenie.status.atlassian.com/api/v2/incidents.json | jq -r ".incidents[$i] | {Issue: .name, Created: .created_at, Status: .status}"
done
