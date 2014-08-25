  Meteor.startup ->
    AccountsEntry.config
      #signupCode: "s3cr3t"
      defaultProfile:
        someDefault: "default"
    return

    Accounts.validateNewUser () ->
      return false