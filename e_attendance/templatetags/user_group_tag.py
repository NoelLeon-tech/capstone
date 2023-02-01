from django import template

register = template.Library() 
# creates new template filter
@register.filter(name='in_group')
        
def in_group(user, group_name):
    return user.groups.filter(name=group_name).exists() 
        