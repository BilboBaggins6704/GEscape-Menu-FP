config = GEscape or {}

include("autorun/client/gescape_config.lua")
local config = GEscape

escapemenu = escapemenu or {}
function escapemenu:show()

    bg = vgui.Create( "DPanel" )
        bg:SetSize( ScrW(), ScrH() )
        bg:Center()
        bg:MakePopup()
        bg:SetVisible ( true )
        bg.Paint = function(self)
            draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), config.Background)
            draw.DrawText(config.ServerName, "Head", self:GetWide() / 6.5, bg:GetTall() / 12.7, Color( 255, 255, 255, 255), TEXT_ALIGN_LEFT)
            draw.DrawText(Entity( 1 ):GetName(), "Mai", self:GetWide() / 1.28, bg:GetTall() / 13, TimeDate, TEXT_ALIGN_RIGHT)
            draw.DrawText(Entity( 1 ):SteamID(), "Mai", self:GetWide() / 1.28, bg:GetTall() / 9.5, TimeDate, TEXT_ALIGN_RIGHT)
        end

    local options = vgui.Create( "DButton", bg )
        options:SetSize( bg:GetWide() / 55, bg:GetTall() / 28 )
        options:SetText( "" )
        options:SetPos( bg:GetWide() / 1.214, bg:GetTall() / 6.4 )
        options:SetVisible( true )
        options.DoClick = function()
            RunConsoleCommand( "gamemenucommand", "openoptionsdialog" )
            gui.ActivateGameUI() 
        end
        options.Paint = function()
        if options:IsHovered() == true then
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( Material("materials/gescape/options.png", "unlitgeneric") )
            surface.DrawTexturedRect( options:GetWide() / 12, options:GetTall() / 9, bg:GetWide() / 60, bg:GetTall() / 32 )
            else
            surface.SetDrawColor( 0, 0, 0, 220 )
            surface.SetMaterial( Material("materials/gescape/options.png", "unlitgeneric") )
            surface.DrawTexturedRect( options:GetWide() / 12, options:GetTall() / 9, bg:GetWide() / 60, bg:GetTall() / 33 )
            end
        end

        local Boxy = vgui.Create( "DFrame", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetTitle( "" )
            Boxy:SetDraggable( false )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy:ShowCloseButton( false )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy.Paint = function(self)
                draw.RoundedBox( 0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

        local MainSitey = vgui.Create( "HTML", Boxy )
            MainSitey:SetPos( 0, 0 )
            MainSitey:DockMargin( 5, 5, 5, 5 )
            MainSitey:Dock( FILL )
            MainSitey:OpenURL( config.MainSite )

        local MainBar = vgui.Create( "DHTMLControls", Boxy )
            MainBar:SetWide( Boxy:GetWide() / 1.014 )
            MainBar:DockMargin( 5, 5, 5, 5 )
            MainBar:SetPos( 9, 0 )
            MainBar:SetHTML ( MainSitey )
            MainBar.AddressBar:SetText( config.MainSite )

            MainSitey:MoveBelow( MainBar )

    local resume = vgui.Create( "DButton", bg )
        resume:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        resume:SetText( "" )
        resume:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 6.5 )
        resume:SetVisible( true )
        resume.DoClick = function()

            hook.Remove( "HUDPaint", "OriginCam" )
            surface.PlaySound( "gescape/button.mp3" )
            bg:Remove()

        end
        resume.Paint = function()
        if resume:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText("Resume!", "Mai", resume:GetWide() / 2.1, resume:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText("Resume!", "Mai", resume:GetWide() / 2.1, resume:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end

    local site = vgui.Create( "DButton", bg )
        site:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        site:SetText( "" )
        site:SetPos( bg:GetWide() / 4, bg:GetTall() / 6.5 )
        site:SetVisible( true )
        site.DoClick = function()

            hook.Remove( "HUDPaint", "OriginCam" )
            Boxy:Remove()

            surface.PlaySound( "gescape/button.mp3" )

            Boxy = vgui.Create( "DFrame", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetTitle( "" )
            Boxy:SetDraggable( false )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy:ShowCloseButton( false )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy.Paint = function()
                    draw.RoundedBox( 0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

            Website = vgui.Create( "HTML", Boxy )
            Website:SetPos( 0, 0 )
            Website:DockMargin( 5, 5, 5, 5 )
            Website:Dock( FILL )
            Website:OpenURL( config.Website )

            Webbar = vgui.Create( "DHTMLControls", Boxy )
            Webbar:SetWide( Boxy:GetWide() / 1.014 )
            Webbar:DockMargin( 5, 5, 5, 5 )
            Webbar:SetPos( 9, 0 )
            Webbar:SetHTML ( Website )
            Webbar.AddressBar:SetText( config.Website )
            
            Website:MoveBelow( Webbar )
        end

        site.Paint = function()
        if site:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText(config.WName, "Mai", site:GetWide() / 2.1, site:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText(config.WName, "Mai", site:GetWide() / 2.1, site:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end

    local rules = vgui.Create( "DButton", bg )
        rules:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        rules:SetText( "" )
        rules:SetPos( bg:GetWide() / 2.26, bg:GetTall() / 6.5 )
        rules:SetVisible( true )
        rules.DoClick = function()

        hook.Remove( "HUDPaint", "OriginCam" )
        Boxy:Remove()

        surface.PlaySound( "gescape/button.mp3" )

        Boxy = vgui.Create( "DPanel", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy.Paint = function()
                draw.RoundedBox(0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

        TheRules = vgui.Create( "DTextEntry", Boxy )
        TheRules:SetPos( 10, 10 )
        TheRules:Dock( FILL )
        TheRules:SetDrawBackground( false )
        TheRules:SetMultiline( true )
        TheRules:SetText(config.Text)
        TheRules:DockMargin( 5, 5, 5, 5 )
        TheRules:SetFont("Mai")
        TheRules:SetTextColor( Color( 255, 255, 255, 255 ) )
        TheRules:SetVerticalScrollbarEnabled( true )

        end
        rules.Paint = function()
        if rules:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText(config.RName, "Mai", rules:GetWide() / 2.1, rules:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText(config.RName, "Mai", rules:GetWide() / 2.1, rules:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end

    local donate = vgui.Create( "DButton", bg )
        donate:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        donate:SetText( "" )
        donate:SetPos( bg:GetWide() / 2.89, bg:GetTall() / 6.5 )
        donate:SetVisible( true )
        donate.DoClick = function()

            Boxy:Remove()
            hook.Remove( "HUDPaint", "OriginCam" )
            
            surface.PlaySound( "gescape/button.mp3" )

            Boxy = vgui.Create( "DFrame", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetTitle( "" )
            Boxy:SetDraggable( false )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy:ShowCloseButton( false )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy.Paint = function()
                    draw.RoundedBox( 0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

            Donsite = vgui.Create( "HTML", Boxy )
            Donsite:SetPos( 0, 0 )
            Donsite:DockMargin( 5, 5, 5, 5 )
            Donsite:Dock( FILL )
            Donsite:OpenURL( config.Donate )

            Donbar = vgui.Create( "DHTMLControls", Boxy )
            Donbar:SetWide( Boxy:GetWide() / 1.014 )
            Donbar:DockMargin( 5, 5, 5, 5 )
            Donbar:SetPos( 9, 0 )
            Donbar:SetHTML ( Donsite )
            Donbar.AddressBar:SetText( config.Donate )
            
            Donsite:MoveBelow( Donbar )
        end

        donate.Paint = function()
        if donate:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText(config.DName, "Mai", donate:GetWide() / 2.1, donate:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText(config.DName, "Mai", donate:GetWide() / 2.1, donate:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end

    local news = vgui.Create( "DButton", bg )
        news:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        news:SetText( "" )
        news:SetPos( bg:GetWide() / 1.856, bg:GetTall() / 6.5 )
        news:SetVisible( true )
        news.DoClick = function()

        surface.PlaySound("gescape/button.mp3")

        Boxy:Remove()

        Boxy = vgui.Create( "DPanel", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy.Paint = function()
                draw.RoundedBox(0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

        TheRules = vgui.Create( "DTextEntry", Boxy )
        TheRules:SetPos( 10, 10 )
        TheRules:Dock( FILL )
        TheRules:SetDrawBackground( false )
        TheRules:SetMultiline( true )
        TheRules:SetText(config.NewsT)
        TheRules:DockMargin( 5, 5, 5, 5 )
        TheRules:SetFont("Mai")
        TheRules:SetTextColor( Color( 255, 255, 255, 255 ) )
        TheRules:SetVerticalScrollbarEnabled( true )
    end

        news.Paint = function()
        if news:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText(config.NNews, "Mai", news:GetWide() / 2.1, news:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText(config.NNews, "Mai", news:GetWide() / 2.1, news:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end

if config.Servers == true then
    local servers = vgui.Create( "DButton", bg )
        servers:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        servers:SetText( "" )
        servers:SetPos( bg:GetWide() / 1.574, bg:GetTall() / 6.5 )
        servers:SetVisible( true )
        servers.DoClick = function()

            Boxy:Remove()
            hook.Remove( "HUDPaint", "OriginCam" )

            surface.PlaySound( "gescape/button.mp3" )

            Boxy = vgui.Create( "DFrame", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetTitle( "" )
            Boxy:SetDraggable( false )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy:ShowCloseButton( false )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy.Paint = function()
                    draw.RoundedBox( 0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

            // Start of Server One.

            S1 = vgui.Create( "DButton", Boxy )
            S1:SetPos( Boxy:GetWide() / 1000, Boxy:GetTall() / 500 )
            S1:SetSize( bg:GetWide() / 3.54, bg:GetTall() / 23.5 )
            S1:SetText( "" )
            S1:SetVisible( true )
            S1.Paint = function()
            if S1:IsHovered() == true then
                draw.RoundedBox(0, 0, 0, S1:GetWide(), S1:GetTall(), Color( 0, 0, 0, 230 ))
                draw.DrawText("Join our DarkRP Server!", "Mai", S1:GetWide() / 2.1, S1:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox(0, 0, 0, S1:GetWide(), S1:GetTall(), config.PColor)
                draw.DrawText("Join our DarkRP Server!", "Mai", S1:GetWide() / 2.1, S1:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
            end
            S1.DoClick = function()


                SB = vgui.Create( "DFrame", Boxy )
                SB:SetPos( Boxy:GetWide() / 2.3, Boxy:GetTall() / 500 )
                SB:SetTitle( "" )
                SB:SetDraggable( false )
                SB:ShowCloseButton( false )
                SB:SetSize( Boxy:GetWide(), Boxy:GetTall() / 3.7 )
                SB.Paint = function()
                    draw.RoundedBox( 0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 0 ))
                end

            SInfo = vgui.Create( "DButton", SB )
            SInfo:SetPos( 0, 0 )
            SInfo:SetSize( SB:GetWide() / 1.5, SB:GetTall() / 2.6 )
            SInfo:SetText("")
            SInfo:SetFont("Mai")
            SInfo.DoClick = function()
                LocalPlayer():ConCommand( config.IPOne )
            end
            SInfo.Paint = function()
            if SInfo:IsHovered() == true then
                draw.RoundedBox( 0, 0, 0, SInfo:GetWide(), SInfo:GetTall(), Color( 0, 0, 0, 230 ))
                draw.DrawText("Click here to join!", "Heu", SInfo:GetWide() / 2.4, SInfo:GetTall() / 6, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox( 0, 0, 0, SInfo:GetWide(), SInfo:GetTall(), config.PColor)
                draw.DrawText("Click here to join!", "Heu", SInfo:GetWide() / 2.4, SInfo:GetTall() / 6, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
            end
        end
    end
end

        // End of Server One.
        // Start of Server Two.

if config.PortalTwo == true then
            S2 = vgui.Create( "DButton", Boxy )
            S2:SetPos( Boxy:GetWide() / 1000, Boxy:GetTall() / 12 )
            S2:SetSize( bg:GetWide() / 3.54, bg:GetTall() / 23.5 )
            S2:SetText( "" )
            S2:SetVisible( true )
            S2.Paint = function()
            if S2:IsHovered() == true then
                draw.RoundedBox(0, 0, 0, S2:GetWide(), S2:GetTall(), Color( 0, 0, 0, 230 ))
                draw.DrawText("Join our Surf Server!", "Mai", S2:GetWide() / 2.1, S2:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox(0, 0, 0, S2:GetWide(), S2:GetTall(), config.PColor)
                draw.DrawText("Join our Surf Server!", "Mai", S2:GetWide() / 2.1, S2:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
            end
            S2.DoClick = function()

                SB = vgui.Create( "DFrame", Boxy )
                SB:SetPos( Boxy:GetWide() / 2.3, Boxy:GetTall() / 500 )
                SB:SetTitle( "" )
                SB:SetDraggable( false )
                SB:ShowCloseButton( false )
                SB:SetSize( Boxy:GetWide(), Boxy:GetTall() / 3.7 )
                SB.Paint = function()
                    draw.RoundedBox( 0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 0 ))
                end

            SInfo = vgui.Create( "DButton", SB )
            SInfo:SetPos( 0, 0 )
            SInfo:SetSize( SB:GetWide() / 1.5, SB:GetTall() / 2.6 )
            SInfo:SetText("")
            SInfo:SetFont("Main")
            SInfo.DoClick = function()
                LocalPlayer():ConCommand( config.IPTwo )
            end
            SInfo.Paint = function()
            if SInfo:IsHovered() == true then
                draw.RoundedBox( 0, 0, 0, SInfo:GetWide(), SInfo:GetTall(), Color( 0, 0, 0, 230 ))
                draw.DrawText("Click here to join!", "Heu", SInfo:GetWide() / 2.4, SInfo:GetTall() / 6, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox( 0, 0, 0, SInfo:GetWide(), SInfo:GetTall(), config.PColor)
                draw.DrawText("Click here to join!", "Heu", SInfo:GetWide() / 2.4, SInfo:GetTall() / 6, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
            end
            end
        end
    end
end

            // End of Server Two.
            // Start of Server Three.

if config.PortalThree == true then
            S3 = vgui.Create( "DButton", Boxy )
            S3:SetPos( Boxy:GetWide() / 1000, Boxy:GetTall() / 6 )
            S3:SetSize( bg:GetWide() / 3.54, bg:GetTall() / 23.5 )
            S3:SetText( "" )
            S3:SetVisible( true )
            S3.Paint = function()
            if S3:IsHovered() == true then
                draw.RoundedBox(0, 0, 0, S3:GetWide(), S3:GetTall(), Color( 0, 0, 0, 230 ))
                draw.DrawText("Join our MiniGames Server!", "Mai", S3:GetWide() / 2.1, S3:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox(0, 0, 0, S3:GetWide(), S3:GetTall(), config.PColor)
                draw.DrawText("Join our MiniGames Server!", "Mai", S3:GetWide() / 2.1, S3:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
            end
            S3.DoClick = function()

                SB = vgui.Create( "DFrame", Boxy )
                SB:SetPos( Boxy:GetWide() / 2.3, Boxy:GetTall() / 500 )
                SB:SetTitle( "" )
                SB:SetDraggable( false )
                SB:ShowCloseButton( false )
                SB:SetSize( Boxy:GetWide(), Boxy:GetTall() / 3.7 )
                SB.Paint = function()
                    draw.RoundedBox( 0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 0 ))
                end

            SInfo = vgui.Create( "DButton", SB )
            SInfo:SetPos( 0, 0 )
            SInfo:SetSize( SB:GetWide() / 1.5, SB:GetTall() / 2.6 )
            SInfo:SetText("")
            SInfo:SetFont("Mai")
            SInfo.DoClick = function()
                LocalPlayer():ConCommand( config.IPThree )
            end
            SInfo.Paint = function()
            if SInfo:IsHovered() == true then
                draw.RoundedBox( 0, 0, 0, SInfo:GetWide(), SInfo:GetTall(), Color( 0, 0, 0, 230 ))
                draw.DrawText("Click here to join!", "Heu", SInfo:GetWide() / 2.4, SInfo:GetTall() / 6, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox( 0, 0, 0, SInfo:GetWide(), SInfo:GetTall(), config.PColor)
                draw.DrawText("Click here to join!", "Heu", SInfo:GetWide() / 2.4, SInfo:GetTall() / 6, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
            end
            end
        end
    end
end
        end
        servers.Paint = function()
        if servers:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText("Servers!", "Mai", servers:GetWide() / 2.1, servers:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
            else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText("Servers!", "Mai", servers:GetWide() / 2.1, servers:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
            end
        end
end

if config.Servers == true then
    local disconnect = vgui.Create( "DButton", bg )
        disconnect:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        disconnect:SetText( "" )
        disconnect:SetPos( bg:GetWide() / 1.368, bg:GetTall() / 6.5 )
        disconnect:SetVisible( true )
        disconnect.DoClick = function()
            surface.PlaySound( "gescape/button.mp3" )
            RunConsoleCommand( "disconnect" )
        end
        disconnect.Paint = function()
        if disconnect:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText("Disconnect!", "Mai", disconnect:GetWide() / 2.1, disconnect:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText("Disconnect!", "Mai", disconnect:GetWide() / 2.1, disconnect:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end
end

if config.Servers == false then
    local disconnect = vgui.Create( "DButton", bg )
        disconnect:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        disconnect:SetText( "" )
        disconnect:SetPos( bg:GetWide() / 1.574, bg:GetTall() / 6.5 )
        disconnect:SetVisible( true )
        disconnect.DoClick = function()
            surface.PlaySound( "gescape/button.mp3" )
            RunConsoleCommand( "disconnect" )
        end
        disconnect.Paint = function()
        if disconnect:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText("Disconnect!", "Mai", disconnect:GetWide() / 2.1, disconnect:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText("Disconnect!", "Mai", disconnect:GetWide() / 2.1, disconnect:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end
end

    local Avatar = vgui.Create( "AvatarImage", bg )
    Avatar:SetSize( bg:GetWide() / 30, bg:GetTall() / 17 )
    Avatar:SetPos( bg:GetWide() / 1.27, bg:GetTall() / 12.7 )
    Avatar:SetPlayer( LocalPlayer(), 64 )

end

-- This is for removing bg and calling escapemenu:show 
hook.Add('PreRender', 'RemoveEscapeMenu', function()

        if gui.IsGameUIVisible() and input.IsKeyDown( KEY_ESCAPE ) then
            if ValidPanel( bg ) then
                bg:Remove()
                hook.Remove( "HUDPaint", "OriginCam" )
                hook.Remove( "HUDPaint", "blurscreen")
                gui.HideGameUI()
             else
                surface.PlaySound( "gescape/open.mp3" )
                escapemenu:show()
                gui.HideGameUI() 
            end
        end
    end)

surface.CreateFont( "Mai", {
    font = "Trebuchet24",
    size = ScreenScale( 25 ) * (640 / 1776),
    weight = 0,
    blursize = 0,
    antialias = true
} )

surface.CreateFont( "Heu", {
    font = "Trebuchet24",
    size = ScreenScale( 40 ) * (640 / 1776),
    weight = 0,
    blursize = 0,
    antialias = true
} )

surface.CreateFont( "Head", {
    font = "Typo College Demo",
    size = ScreenScale( 70 ) * (640 / 1776),
    weight = 0,
    blursize = 0,
    antialias = true
} )