import '../../models/donors_age_by_blood_type_model.dart';
import '../../models/donors_by_age_model.dart';
import '../../models/donors_by_state_model.dart';
import '../../models/donors_obesity_by_gender_model.dart';
import '../../models/possible_donors_by_blood_type_model.dart';

abstract class DonorsRemoteDataSource {
  Future<void> syncDonors();
  Future<List<DonorsAgeByBloodTypeModel>> getDonorsAgeByType();
  Future<List<DonorsByAgeModel>> getDonorsByAge();
  Future<List<DonorsByStateModel>> getDonorsByState();
  Future<List<DonorsObesityByGenderModel>> getObesityByGender();
  Future<List<PossibleDonorsByBloodTypeModel>> getPossibleDonors();
}
