import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export default class Sensor {

    @PrimaryGeneratedColumn("uuid")
    id!: string;

    @Column({ nullable: false, type: "varchar" })
    nome!: string;

    @Column({ type: "varchar", nullable: false, unique: true })
    serialNumber!: string;



}