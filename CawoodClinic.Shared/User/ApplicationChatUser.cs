using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CawoodClinic.Shared.User;
public class ApplicationChatUser
{
    public ApplicationChatUser(string userId, string userName, string role)
    {
        UserId = userId;
        UserName = userName;
        Role = role;
    }

    public string UserId { get; set; }
    public string UserName { get; set; }
    public string Role { get; set; }


    public override int GetHashCode()
    {
        return UserId.GetHashCode();
    }

    public override bool Equals(object obj)
    {
        if (obj == null || !(obj is ApplicationChatUser))
            return false;

        ApplicationChatUser otherUser = (ApplicationChatUser)obj;
        return UserId == otherUser.UserId;
    }
}