function onSay(cid, words, param)
	local n = 1
	if(param ~= "" and tonumber(param)) then
		n = tonumber(param)
	end

	local pos = getPosByDir(getCreaturePosition(cid), getPlayerLookDir(cid), n)
	pos.stackpos = STACKPOS_GROUND
	if(getTileThingByPos(pos).uid == 0)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot teleport there.")
		return FALSE
	end

	pos = getClosestFreeTile(cid, pos)
	if(pos == LUA_ERROR or isInArray({pos.x, pos.y, pos.z}, 0) == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Destination not reachable.")
		return FALSE
	end

	local tmp = getCreaturePosition(cid)
	if(doTeleportThing(cid, pos, TRUE) ~= LUA_ERROR and isPlayerGhost(cid) ~= TRUE) then
		doSendMagicEffect(tmp, CONST_ME_POFF)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
	end

	return TRUE
end
