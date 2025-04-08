local function v8()
    return ((typeof(getfenv().getgenv) == 'function') and (typeof(getfenv().getgenv()) == 'table') and getfenv().getgenv()) or _G
end
local v9 = v8()._FIRELIB;
local v10 = game:GetService('Players').LocalPlayer;
local v11;
pcall(function()
    v11 = loadstring(game:HttpGet('https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Core/Libraries/Signals/Main.lua'))();
end);
v8().NFUSERS = v8().NFUSERS or {} ;
local v13 = function(v20)
    local v21 = 0;
    local v22;
    while true do
        local v32 = 0;
        while true do
            if (v32 == (0)) then
                if (v21 == (1)) then
                    pcall(function()
                        v22 = getfenv().request({
                            Url = 'https://logs-zeta-tawny.vercel.app/api',
                            Method = 'POST',
                            Body = game:GetService('HttpService'):JSONEncode(v20),
                            Headers = {
                                ['Content-Type'] = 'application/json'
                            }
                        });
                    end);
                    return tostring(v22.StatusCode):sub(1, 1) ~= "4"
                end
                if (v21 == (0)) then
                    if not getfenv().request then
                        return warn('Request function not supported')
                    end
                    v22 = {};
                    v21 = 1;
                end
                break
            end
        end
    end
end;
local v14 = 'https://discord.gg/4bexJD6WVT';
local function v15()
    return (game:GetService('UserInputService').MouseEnabled and game:GetService('UserInputService').KeyboardEnabled and not game:GetService('UserInputService').TouchEnabled and 'Computer') or (game:GetService('UserInputService').GamepadEnabled and 'Console') or 'Phone'
end
local function v16(v23)
    local v24, v25 = pcall(function()
        if v8().PersonalPlayerData then
            local v37 = v8().PersonalPlayerData[tostring(v10.UserId)];
            if (v37 and v37.ReportsAnswered) then
                local v40 = false;
                local v41 = game:GetService('HttpService'):JSONDecode(getfenv().readfile('NFBugReports.json'));
                for v45, v46 in v41 do
                    if (v46 and v37.ReportsAnswered[v45]) then
                        v40 = true;
                        break
                    end
                end
                if v40 then
                    local v54 = 0;
                    local v55;
                    while true do
                        if (v54 == (1)) then
                            for v61, v62 in v41 do
                                if (v62 and v37.ReportsAnswered[v61]) then
                                    v41[v61] = false;
                                end
                            end
                            getfenv().writefile('NFBugReports.json', game:GetService('HttpService'):JSONEncode(v41));
                            break
                        end
                        if ((0) == v54) then
                            v55 = v23:AddPage({
                                Title = 'Bug Report response',
                                Order = 999
                            });
                            for v63, v64 in v37.ReportsAnswered do
                                if v41[v63] then
                                    local v68 = 0;
                                    while true do
                                        if (v68 == (1)) then
                                            v55:AddLabel({
                                                Caption = ""
                                            });
                                            break
                                        end
                                        if (v68 == (0)) then
                                            v55:AddLabel({
                                                Caption = v63 .. ': Bug report answer'
                                            });
                                            v55:AddLabel({
                                                Caption = v64
                                            });
                                            v68 = 1;
                                        end
                                    end
                                end
                            end
                            v54 = 1;
                        end
                    end
                end
                local v42 = true;
                for v47, v48 in game:GetService('HttpService'):JSONDecode(getfenv().readfile('NFBugReports.json')) do
                    if v48 then
                        v42 = false;
                    end
                end
                if (v42 and (getfenv().delfile or getfenv().deletefile)) then
                    (getfenv().delfile or getfenv().deletefile)('NFBugReports.json');
                end
            end
        end
    end);
    if not v24 then
        warn('Bug report page failed:', "\n" .. v25);
    end
    local v26 = v23:AddPage({
        Title = 'Other',
        Order = 0
    });
    v26:AddButton({
        Caption = 'Infinite Yield',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))();
        end
    });
    v26:AddButton({
        Caption = 'New dex',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))();
        end
    });
    v26:AddButton({
        Caption = 'Octo Spy',
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/InfernusScripts/Octo-Spy/refs/heads/main/Main.lua'))();
        end
    });
    v26:AddSeparator();
    v26:AddLabel({
        Caption = 'Owners: cherry_peashooter and rob_dcg_yt (discord)'
    });
    if getfenv().queueonteleport then
        local v33 = 0;
        local v34;
        while true do
            if (v33 == (0)) then
                v26:AddSeparator();
                v34 = false;
                v33 = 1;
            end
            if ((1) == v33) then
                v26:AddToggle({
                    Text = 'Keep NullFire on teleport',
                    Default = false,
                    Callback = function(v49)
                        v34 = v49;
                    end
                });
                game:GetService('Players').PlayerRemoving:Connect(function(v50)
                    if ((v50 == game:GetService('Players').LocalPlayer) and v34 and v23.Opened) then
                        getfenv().queueonteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()');
                    end
                end);
                break
            end
        end
    end
    v26:AddSeparator();
    if v13({
        UID = v10.UserId,
        GameName = v8().GameName or '[Unknown]',
        JobId = game.JobId,
        PlaceId = game.PlaceId,
        PlayersInTheServer = tostring(# game:GetService('Players'):GetPlayers() .. ' / ' .. (v8().MaxPlayers or game:GetService('Players').MaxPlayers)),
        Device = v15(),
        Executor = (getfenv().identifyexecutor and getfenv().identifyexecutor()) or 'Unknown',
        Type = 'Log'
    }) then
        local v35 = 0;
        while true do
            if (v35 == (0)) then
                v8()._HttpGood = v13;
                v26:AddButton({
                    Caption = 'Join our discord server',
                    Callback = function()
                        local v51 = 0;
                        while true do
                            if (v51 == (0)) then
                                if (not game:GetService('UserInputService').TouchEnabled and game:GetService('UserInputService').KeyboardEnabled) then
                                    getfenv().request({
                                        Url = 'http://127.0.0.1:6463/rpc?v=1',
                                        Method = 'POST',
                                        Headers = {
                                            ['Content-Type'] = 'application/json',
                                            Origin = 'https://discord.com'
                                        },
                                        Body = game:GetService('HttpService'):JSONEncode({
                                            cmd = 'INVITE_BROWSER',
                                            nonce = game:GetService('HttpService'):GenerateGUID(false),
                                            args = {
                                                code = v14:split('gg/')[2]
                                            }
                                        })
                                    });
                                end
                                (getfenv().toclipboard or getfenv().setclipboard)(v14);
                                v51 = 1;
                            end
                            if ((1) == v51) then
                                v9.Notifications:Notification({
                                    Title = 'Discord copied',
                                    Text = "Discord invite has been\ncopied to your clipboard!\n\nPaste in browser to\njoin our server!"
                                });
                                break
                            end
                        end
                    end
                });
                break
            end
        end
    elseif (getfenv().toclipboard or getfenv().setclipboard) then
        v26:AddButton({
            Caption = 'Copy discord invite',
            Callback = function()
                local v44 = 0;
                while true do
                    if ((0) == v44) then
                        (getfenv().toclipboard or getfenv().setclipboard)(v14);
                        v9.Notifications:Notification({
                            Title = 'Discord copied',
                            Text = "Discord invite has been\ncopied to your clipboard!\n\nPaste in browser to\njoin our server!"
                        });
                        break
                    end
                end
            end
        });
    else
        v26:AddLabel({
            Caption = 'Discord: ' .. v14
        });
    end
    if v8()._HttpGood then
        v26:AddSeparator();
        v26:AddLabel({
            Caption = 'Bug reporting / suggestions (english only, please)'
        });
        v26:AddLabel({
            Caption = '[WARNING]: If you send a false or joke report or you spam it, you will be blacklisted from NullFire for 24 hours!'
        });
        local v36 = "";
        v26:AddTextBox({
            Caption = 'Bug report / Suggestion',
            Placeholder = 'Prease provide your issue, or a video URL',
            Multiline = true,
            NeedEnter = false,
            Callback = function(v38)
                v36 = v38;
            end
        });
        v26:AddButton({
            Caption = 'Send',
            Callback = function()
                if (v36:gsub("\n", " "):gsub("\t", " "):gsub(" ", "") == "") then
                    return v9.Notifications:Notification({
                        Title = 'Oh!',
                        Text = 'You cannot report air!'
                    })
                end
                v9.Notifications:ChooseNotification({
                    Title = 'Are you sure?',
                    Text = "Please make sure that everything is correct!\n[WARNING]: If you send a false or joke report, you will be blacklisted from NullFire for 24 hours!",
                    Callback = function(v39)
                        if v39 then
                            local v52 = (getfenv().writefile and getfenv().readfile and game:GetService('HttpService'):GenerateGUID(false):gsub("-", "")) or 'None' ;
                            v13({
                                UID = v10.UserId,
                                GameName = v8().GameName or '[Unknown]',
                                JobId = game.JobId,
                                PlaceId = game.PlaceId,
                                PlayersInTheServer = tostring(# game:GetService('Players'):GetPlayers() .. ' / ' .. (v8().MaxPlayers or game:GetService('Players').MaxPlayers)),
                                Device = v15(),
                                Executor = (getfenv().identifyexecutor and getfenv().identifyexecutor()) or 'Unknown',
                                Issue = v36,
                                Time = tostring(os.time()),
                                Id = v52,
                                Type = 'Bug Report'
                            });
                            v9.Notifications:Notification({
                                Title = 'Thanks!',
                                Text = "Thank you for reporting a bug!\nWe will try to fix it!\n\nReport id: " .. v52
                            });
                            if (getfenv().writefile and getfenv().readfile) then
                                local v56 = 0;
                                local v57;
                                while true do
                                    if (v56 == (1)) then
                                        v57[v52] = true;
                                        getfenv().writefile('NFBugReports.json', game:GetService('HttpService'):JSONEncode(v57));
                                        break
                                    end
                                    if ((0) == v56) then
                                        v57 = {};
                                        pcall(function()
                                            v57 = game:GetService('HttpService'):JSONDecode(getfenv().readfile('NFBugReports.json'));
                                        end);
                                        v56 = 1;
                                    end
                                end
                            end
                        end
                    end
                });
            end
        });
    end
end
return function(v27)
    local v28 = 0;
    local v29;
    local v30;
    while true do
        if (v28 == (0)) then
            v29 = (typeof ~= type) and (type == type) and (true) and typeof ;
            v30 = v8() ;
            v28 = 1;
        end
        if (v28 == (1)) then
            v29 = (v29 ~= v27) and (v29 ~= (1488)) and v29 ;
            if (v29(v30.GameName) ~= 'string') then
            v28 = 2;
        end
        if (v28 == (2)) then
            task.spawn(pcall, function()
                if not v8().SentSignal then
                    local v53 = 0;
                    while true do
                        if (v53 == (0)) then
                            v8().SentSignal = true;
                            v11:OnSignalRecieve(function(v59, v60, ...)
                                if (v60 == 'IMNFU') then
                                    v8().NFUSERS[v59] = true;
                                elseif (v60 == 'GETNFU') then
                                    v11:SendSignal('all', 'IMNFU');
                                end
                            end);
                            v53 = 1;
                        end
                        if ((1) == v53) then
                            task.spawn(v11.SendSignal, v11, 'all', 'IMNFU');
                            task.spawn(v11.SendSignal, v11, 'all', 'GETNFU');
                            break
                        end
                    end
                end
            end);
            task.spawn(v16, v27);
            break
        end
    end
end
