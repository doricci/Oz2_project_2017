functor
import
    GUI
    Input
    PlayerManager

    System
    OS
define
	PortWindow

	Players
	Test
  Round

	fun{GetElementInList L I}
	   case L of H|T then
	      if I == 1 then
		      H
	      else
		      {GetElementInList T I-1}
	      end
	   end
	end


  proc{InitPositionPlayers Idnum} ID Position in
      {Send Players.Idnum initPosition(ID Position)}
      {Send PortWindow initPlayer(ID Position)}
  end

  proc{MovePlayers Idnum} ID Position Direction in
      {Send Players.Idnum move(ID Position Direction)}
      {Send PortWindow movePlayer(ID Position)}
  end


in
  Round = 1
	PortWindow = {GUI.portWindow}

  {System.showInfo 'Hello world'}

	{Send PortWindow buildWindow}

	Players={MakeTuple players Input.nbPlayer}
	for I in 1..Input.nbPlayer do
		Players.I={PlayerManager.playerGenerator {GetElementInList Input.players I} {GetElementInList Input.colors I} I}
	end

  for I in 1..Input.nbPlayer do
    {InitPositionPlayers I}
  end

  for I in 1..Input.nbPlayer do
    {MovePlayers I}
  end

end
