import smtplib

gmail_user = input("email: ")
gmail_password = input('password: ')

sent_from = gmail_user
to = [input("reciever: ")]
subject = 'subject'
body = 'message'

email_text = """\
From: %s
To: %s
Subject: %s

%s
""" % (sent_from, ", ".join(to), subject, body)

try:
	smtp_server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
	smtp_server.ehlo()
	smtp_server.login(gmail_user, gmail_password)

    # Sends a lot of emails
	sendvar = 0
	while sendvar <= 50:
		smtp_server.sendmail(sent_from, to, email_text)
		sendvar += 1


	smtp_server.close()
	print ("Emails sent successfully!")
except Exception as ex:
    print ("Something went wrong….",ex)
