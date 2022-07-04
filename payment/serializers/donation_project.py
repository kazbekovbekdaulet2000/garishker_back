from rest_framework import serializers
from payment.models.donation_project import Donation


class DonationProjectSerializer(serializers.ModelSerializer):
    collected = serializers.SerializerMethodField()
    required = serializers.SerializerMethodField()

    def get_required(self, obj) -> int:
        return round(obj.required / 100, 2)

    def get_collected(self, obj) -> int:
        all_donations = obj.donat.filter(status=1).values_list("amount", flat=True)
        sum = 0
        for donation in all_donations:
            sum += donation
        return round(sum / 100, 2)

    class Meta:
        model = Donation
        fields = ('id', 'collected', 'default_options', 'title_kk',
                  'title_ru', 'description_kk', 'description_ru', 'required')
