Small Discourse plugin designed to make the normalize whitespace function in Discourse's TextCleaner optional/toggleable from the admin menu. 

With this plugin, non-breaking-spaces and other whitespace
("(\u00A0|\u1680|\u180E|[\u2000-\u200A]|\u2028|\u2029|\u202F|\u205F|\u3000)",)
are not converted to standard spaces.

Note that allowing this functionality could allow for minor trolling as noted here:
https://meta.discourse.org/t/no-break-space-and-narrow-no-break-space-are-replaced-by-space/169410/8
