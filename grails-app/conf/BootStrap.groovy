import com.fms.auth.Role
import com.fms.auth.User
import com.fms.auth.UserRole
import com.fms.ttleague.LeagueMatch
import com.fms.ttleague.Player
import com.fms.ttleague.Prediction

class BootStrap {

    def init = { servletContext ->
		if(!User.findByUsername("LeagueAdmin")){
			def user =new User(username:"LeagueAdmin", password:"fmstt124#")
			user.save(flush:true)
			println"------------------------------------------"
			println user.errors
			def roleAdmin=new Role(authority:"ROLE_ADMIN")
			roleAdmin.save(flush:true)
			new UserRole(user:user, role:roleAdmin).save(flush:true)
		}
		if(LeagueMatch.list().size() <1){
			def a = ["Ramanujan R", "Retheeshkumar K P",  "Sarath N K",  "Sooraj M V",  "Martin Joseph", "Davis Tom",  "Anwar A",  "Harikrishnan K",  "Shandanu N Namboothiri","Tobe Raju",  "Ganesh",  "Renjith",  "Sudheesh P","Visal"]
			def playerList = []
			if(Player.list().size() < 1){
			a.eachWithIndex {it,idx->
				def p = new Player(playerName:it,seed:idx)
				p.save(flush:true)
				playerList.add(p.id)
			}
			}else{
			playerList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
			}
			println playerList
			playerList.each{p1->
				println "loop---1"
				def b = []
				 playerList.each{
					 if(it != p1)
					 b.add(it)
				 }
				b.each{p2->
					println p1+"---"+p2
				  def m = new LeagueMatch(playerHome:Player.get(p1),playerAway:Player.get(p2),isCompleted:false)
				  m.save(flush:true) 
				  println m.errors
				}
			}
		}
		
		if(User.list().size()<2){
			def a = ["ramanujan@foundingminds.com":"Ramanujan R", "retheeshkumar@foundingminds.com":"Retheeshkumar K P", 
			 "sarath@foundingminds.com":"Sarath N K",  "sooraj@foundingminds.com":"Sooraj M V",  "martin@foundingminds.com":"Martin Joseph", "davis.tom@foundingminds.com":"Davis Tom",  "anwar.a@foundingminds.com":"Anwar A",  "harikrishnan@foundingminds.com":"Harikrishnan K",  
			 "shandanu@foundingminds.com":"Shandanu N Namboothiri","tobe@foundingminds.com":"Tobe Raju",  "ganesh@foundingminds.com":"Ganesh",  "renjith.cs@foundingminds.com":"Renjith",  "sudheesh@foundingminds.com":"Sudheesh P","vishal@foundingminds.com":"Visal","athira.nair@foundingminds.com":"Athira","jithi.ganesh@foundingminds.com":"Jithi","arun.neeraj@foundingminds.com":"Arun Neeraj"]
			def roleUser=new Role(authority:"ROLE_USER")
			roleUser.save(flush:true)
			a.each{key,value->
				def user =new User(username:key, password:"abc213#", fullName:value)
				user.save(flush:true)
				println user.errors
				new UserRole(user:user, role:roleUser).save(flush:true)
			}
		}
		if(Prediction.list().size()<1){
			def mList= LeagueMatch.list()
			User.list().each{
				if(!it.username.equals("LeagueAdmin")){
					mList.each{m->
						def pd = new Prediction(leagueMatch:m,user:it)
						pd.save(flush:true)
						println pd.errors
					}
				}
			}
		}
		
    }
    def destroy = {
    }
}
