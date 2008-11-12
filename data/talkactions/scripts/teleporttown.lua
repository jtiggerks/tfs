function onSay(cid, words, param)
	if(param == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
		return FALSE
	end

	local t = string.explode(param, ",")
	if(t[2]) then
		cid = getPlayerByNameWildcard(t[2])
		if(cid == 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. t[2] .. " not found.")
			return FALSE
		end
	end

	local tmp = t[1]
	if(not tonumber(tmp)) then
		tmp = getTownId(tmp)
	end

	local pos = getClosestFreeTile(cid, getTownTemplePosition(tmp))
	if(pos == LUA_ERROR or isInArray({pos.x, pos.y, pos.z}, 0) == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot teleport there.")
		return FALSE
	end

	tmp = getCreaturePosition(cid)
	if(doTeleportThing(cid, pos, TRUE) ~= LUA_ERROR and isPlayerGhost(cid) ~= TRUE) then
		doSendMagicEffect(tmp, CONST_ME_POFF)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
	end

	return TRUE
end
