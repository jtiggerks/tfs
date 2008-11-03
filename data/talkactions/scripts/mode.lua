local nopvpWords = {"1", "nopvp", "nonpvp", "no-pvp", "non-pvp", "safe"}
local pvpWords = {"2", "pvp", "normal"}
local pvpenforcedWords = {"3", "pvpe", "pvpenforced", "pvp-enforced", "war"}

function onSay(cid, words, param)
	if param ~= nil then
		local world = getWorldType()

		param = string.lower(param)
		if table.isStrIn(param, nopvpWords) then
			setWorldType(WORLD_TYPE_NO_PVP)
			world = "No-PVP"
		elseif table.isStrIn(param, pvpWords) then
			setWorldType(WORLD_TYPE_PVP)
			world = "PVP"
		elseif table.isStrIn(param, pvpenforcedWords) then
			setWorldType(WORLD_TYPE_PVP_ENFORCED)
			world = "PVP-Enforced"
		else
			doPlayerSendCancel(cid, "Bad gameworld type.")
			return FALSE
		end

		doBroadcastMessage("Gameworld type set to: " .. world .. ".", MESSAGE_EVENT_ADVANCE)
	else
		doPlayerSendCancel(cid, "Command requires param for action.")
	end
	return TRUE
end
