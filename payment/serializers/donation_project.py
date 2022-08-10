from rest_framework import serializers
from payment.models.donation_project import Donation


class DonationProjectSerializer(serializers.ModelSerializer):
    required = serializers.SerializerMethodField()

    def get_required(self, obj) -> int:
        return round(obj.required / 100, 2)

    class Meta:
        model = Donation
        fields = ('id', 'collected', 'default_options', 'title_kk',
                  'title_ru', 'description_kk', 'description_ru', 'required', 'on_process')
