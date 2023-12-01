hs = {}
if obj.status ~= nil then
    for i, condition in ipairs(obj.status.conditions) do
        if condition.type == "Ready" then
            if condition.status then
                hs.status = "Healthy"
                hs.message = "Keycloak started"
                return hs
            end
        elseif condition.type == "HasErrors" then
            if condition.status then 
                hs.status = "Degraded"
                hs.message = condition.message
                return hs
            end
        end
    end
end

hs.status = "Progressing"
hs.message = "Waiting for Keycloak to start"
return hs