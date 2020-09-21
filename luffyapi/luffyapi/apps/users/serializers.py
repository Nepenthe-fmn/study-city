from rest_framework_jwt.serializers import JSONWebTokenSerializer
from rest_framework import serializers
from rest_framework_jwt.compat import get_username_field, PasswordField
from django.contrib.auth import authenticate, get_user_model
from django.utils.translation import ugettext as _
from rest_framework_jwt.compat import get_username_field, PasswordField


User = get_user_model()
from rest_framework_jwt.settings import api_settings
jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER
jwt_decode_handler = api_settings.JWT_DECODE_HANDLER
jwt_get_username_from_payload = api_settings.JWT_PAYLOAD_GET_USERNAME_HANDLER


class CurtomJSONWebTokenSerializer(JSONWebTokenSerializer):
    """自定义的jwt序列化器"""
    def __init__(self, *args, **kwargs):
        """
        Dynamically add the USERNAME_FIELD to self.fields.
        """
        super(JSONWebTokenSerializer, self).__init__(*args, **kwargs)

        self.fields[self.username_field] = serializers.CharField()
        self.fields['password'] = PasswordField(write_only=True)
        self.fields['ticket'] = serializers.CharField(write_only=True)
        self.fields['randstr'] = serializers.CharField(write_only=True)

    def validate(self, attrs):
        credentials = {
            self.username_field: attrs.get(self.username_field),
            'password': attrs.get('password'),
            'ticket': attrs.get('ticket'),
            'randstr': attrs.get('randstr'),
        }

        if all(credentials.values()):
            user = authenticate(self.context["request"],**credentials)

            if user:
                if not user.is_active:
                    msg = _('User account is disabled.')
                    raise serializers.ValidationError(msg)

                payload = jwt_payload_handler(user)

                return {
                    'token': jwt_encode_handler(payload),
                    'user': user
                }
            else:
                msg = _('Unable to log in with provided credentials.')
                raise serializers.ValidationError(msg)
        else:
            msg = _('Must include "{username_field}" and "password".')
            msg = msg.format(username_field=self.username_field)
            raise serializers.ValidationError(msg)
