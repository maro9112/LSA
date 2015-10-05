# Defined type for creating virtual user accounts
#
define accounts::virtual ($uid,$realname,$group) {
  user { $title:
    ensure            =>  'present',
    uid               =>  $uid,
    gid               =>  $title,
    shell             =>  '/bin/bash',
    home              =>  "/home/${title}",
    comment           =>  $realname,
    password          =>  'passwd',
    managehome        =>  true,
    require           =>  Group[$title],
    groups            =>  [$group]
  }
  
  group { $title:
    gid               =>  $uid,
  }
}

  group { 'managers':
    gid =>  3000,
  }

  group { 'sales':
    gid =>  4000,
  }

  group { 'accounting':
    gid =>  5000,
  }

 class accounts {

  @accounts::virtual { 'mscott':
    uid             =>  1100,
    realname        =>  'Michael Scott',
    group           =>  'managers',
  }

    @accounts::virtual { 'dschrute':
    uid             =>  1101,
    realname        =>  'Dwight Schrute',
    group           =>  'managers',
  }

    @accounts::virtual { 'jhalpert':
    uid             =>  1102,
    realname        =>  'Jim Halpert',
    group           =>  'managers',
  }

    @accounts::virtual { 'tflenderson':
    uid             =>  1103,
    realname        =>  'Toby Flenderson',
    group           =>  'none',
  }

    @accounts::virtual { 'dphilbin':
    uid             =>  1104,
    realname        =>  'Darryl Philbin',
    group           =>  'none',
  }

    @accounts::virtual { 'mpalmer':
    uid             =>  1105,
    realname        =>  'Meredith Palmer',
    group           =>  'none',
  }

    @accounts::virtual { 'pbeesly':
    uid             =>  1106,
    realname        =>  'Pam Beesly',
    group           =>  'none',
  }

    @accounts::virtual { 'cbratton':
    uid             =>  1107,
    realname        =>  'Creed Bratton',
    group           =>  'none',
  }

    @accounts::virtual { 'amartin':
    uid             =>  1108,
    realname        =>  'Angela Martin',
    group           =>  'accounting',
  }

    @accounts::virtual { 'kkapoor':
    uid             =>  1109,
    realname        =>  'Kelly Kapoor',
    group           =>  'none',
  }

    @accounts::virtual { 'abernard':
    uid             =>  1110,
    realname        =>  'Andy Bernard',
    group           =>  'none',
  }

    @accounts::virtual { 'kmalone':
    uid             =>  1111,
    realname        =>  'Kevin Malone',
    group           =>  'accounting',
  }

    @accounts::virtual { 'omartinez':
    uid             =>  1112,
    realname        =>  'Oscar Martinez',
    group           =>  'accounting',
  }

    @accounts::virtual { 'plapin':
    uid             =>  1113,
    realname        =>  'Phyllis Lapin',
    group           =>  'sales',
  }

    @accounts::virtual { 'shudson':
    uid             =>  1114,
    realname        =>  'Stanley Hudson',
    group           =>  'sales',
  }

    @accounts::virtual { 'mrockwell':
    uid             =>  1115,
    realname        =>  'Madison Rockwell',
    group           =>  'none',
  }
}

node default {
  include accounts
  realize (Accounts::Virtual['mscott'])
  realize (Accounts::Virtual['dschrute'])
  realize (Accounts::Virtual['jhalpert'])
  realize (Accounts::Virtual['pbeesly'])
  realize (Accounts::Virtual['abernard'])
  realize (Accounts::Virtual['amartin'])
  realize (Accounts::Virtual['kkapoor'])
  realize (Accounts::Virtual['omartinez'])
  realize (Accounts::Virtual['dphilbin'])
  realize (Accounts::Virtual['tflenderson'])
  realize (Accounts::Virtual['kmalone'])
  realize (Accounts::Virtual['plapin'])
  realize (Accounts::Virtual['shudson'])
  realize (Accounts::Virtual['mpalmer'])
  realize (Accounts::Virtual['cbratton'])
  realize (Accounts::Virtual['mrockwell'])
}