hs = {}
if obj.status ~= nil then
    for i, condition in ipairs(obj.status.conditions) do
        if condition.type == "Done" and condition.status then
            hs.status = "Healthy"
            hs.message = "Keycloak Realm installed"
            return hs
        elseif condition.type == "HasErrors" and condition.status then
            hs.status = "Degraded"
            hs.message = condition.message
            return hs
        elseif condition.type == "Started" and condition.status then
            hs.status = "Progressing"
            hs.message = "Keycloak Realm installing"
            return hs
        end
    end
end

hs.status = "Progressing"
hs.message = "Waiting for the Keycloak Realm to install"
return hs