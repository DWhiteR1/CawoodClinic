using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CawoodClinic.Shared.Enums
{
    public enum LogEventLevel
    {
        /// <summary>
        /// Anything and everything you might want to know about
        /// a running block of code.
        /// </summary>
        [Display(Name = "Verbose")]
        Verbose = 0,

        /// <summary>
        /// Internal system events that aren't necessarily
        /// observable from the outside.
        /// </summary>
        [Display(Name = "Debug")]
        Debug = 1,

        /// <summary>
        /// The lifeblood of operational intelligence - things
        /// happen.
        /// </summary>
        [Display(Name = "Information")]
        Information = 2,

        /// <summary>
        /// Service is degraded or endangered.
        /// </summary>
        [Display(Name = "Warning")]
        Warning = 3,

        /// <summary>
        /// Functionality is unavailable, invariants are broken
        /// or data is lost.
        /// </summary>
        [Display(Name = "Error")]
        Error = 4,

        /// <summary>
        /// If you have a pager, it goes off when one of these
        /// occurs.
        /// </summary>
        [Display(Name = "Fatal")]
        Fatal = 5
    }
}
